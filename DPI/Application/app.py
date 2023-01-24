import numpy as np
import pandas as pd
import sparql_dataframe
import copy
import math

from argparse import ArgumentParser
from pywebio import *
from pywebio.input import *
from pywebio.output import *
from pywebio.pin import *

endpoint = "http://localhost:8080/sparql"
q_prefix = "PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>"

fs_icons_urls = {
    'agro_eco_zone': 'https://cdn-icons-png.flaticon.com/512/2480/2480626.png',
    'agri_pop': 'https://cdn-icons-png.flaticon.com/512/3228/3228936.png',
    'cattle_pop': 'https://cdn-icons-png.flaticon.com/512/7295/7295942.png',
    'cultivated_area': 'https://cdn-icons-png.flaticon.com/512/5341/5341398.png',
    'farm_size': 'https://cdn-icons-png.flaticon.com/512/9246/9246616.png',
    'irrigated_area': 'https://cdn-icons-png.flaticon.com/512/9468/9468700.png', 
    'total_area': 'https://cdn-icons-png.flaticon.com/512/1295/1295109.png', 
    'total_pop': 'https://cdn-icons-png.flaticon.com/512/4596/4596368.png'
}

fs_fields_str = {
    'desc': 'Description',
    'agro_eco_zone': 'Agro-Ecological Zone', 
    'agri_pop': 'Agricultural population', 
    'cattle_pop': 'Cattle population', 
    'cultivated_area': 'Cultivated area', 
    'farm_size': 'Farm size', 
    'irrigated_area': 'Irrigated area', 
    'irrigated_rainfed': 'Irrigate/Rainfed', 
    'total_area': 'Total area', 
    'total_pop': 'Total population'
}

def app():
    put_markdown('# Let\'s explore some Farming Systems')

    with use_scope('dmr_scope'):
        put_markdown('Here you have all available **macro regions**, select the one you are interested in.')
        get_formatted_dmr()

    #put_html(df.to_html(border=0))
    #put_input(label='Search FS', name='search_FS', placeholder='Farming system')
    #put_markdown('Select the farming system you want to further explore.')

def get_formatted_dmr():
    q = """
    %s

    select ?dmr_name ?dmr_label
    where{
        ?dmr a :Dixon_macro_region ;
        :LocationName ?dmr_name ;
        :DixonMRLabel ?dmr_label .
    }
    """ % (q_prefix)

    df = sparql_dataframe.get(endpoint, q)
    for index, row in df.iterrows(): 
        put_button(row['dmr_name'] + " (" + row['dmr_label'] + ')', onclick=lambda dmr_name = row['dmr_name'], dmr_label = row['dmr_label']: process_dmr_selection(dmr_name, dmr_label), color = 'light', outline = False)

def process_dmr_selection(dmr_name, dmr_label):
    with use_scope('dmr_scope', clear = True):
        put_markdown(f"You have selected **{dmr_name} ({dmr_label})**.\nHere are the farming systems that are found in this macro region.")
        put_markdown("Choose one to get more detailed information.")
    
    with use_scope('fs_scope'):
            for fs_name in get_fs_names_from_dmr(dmr_label):
                put_button(fs_name, onclick=lambda l_dmr_label = dmr_label, l_fs_name = fs_name: process_fs_selection(l_dmr_label, l_fs_name), color = 'light', outline = False)

def get_fs_names_from_dmr(dmr_label):
    q = """
    %s

    select ?fs_name
    where{
    ?farming_system a :Farming_system ;
        :FSName ?fs_name .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system .
    }
    """ % (q_prefix, dmr_label)

    return sparql_dataframe.get(endpoint, q)['fs_name'].to_numpy()

def process_fs_selection(dmr_label, fs_name):
    q = """
    %s

    select ?desc ?agro_eco_zone ?agri_pop ?cattle_pop ?cultivated_area ?farm_size ?irrigated_area ?irrigated_rainfed ?total_area ?total_pop
    where{
    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?farming_system a :Farming_system ;
        :FSName "%s" .

        optional { ?farming_system :FSAgriculturalPopulation ?agri_pop } 
        optional { ?farming_system :FSAgroEcologicalZone ?agro_eco_zone } 
        optional { ?farming_system :FSCattlePopulation ?cattle_pop } 
        optional { ?farming_system :FSCultivatedArea ?cultivated_area } 
        optional { ?farming_system :FSDescription ?desc } 
        optional { ?farming_system :FSFarmSize ?farm_size } 
        optional { ?farming_system :FSIrrigatedArea ?irrigated_area } 
        optional { ?farming_system :FSIrrigatedRainfed ?irrigated_rainfed } 
        optional { ?farming_system :FSTotalArea ?total_area } 
        optional { ?farming_system :FSTotalPopulation ?total_pop } 

    ?dixon_macro_region :hostsFarmingSystem ?farming_system .
    }
    """ % (q_prefix, dmr_label, fs_name)

    df_dict = sparql_dataframe.get(endpoint, q).iloc[0].to_dict()

    clear('dmr_scope')
    with use_scope('fs_scope', clear=True):
        put_markdown(f"Here are some details of the **{fs_name}** farming system that might be of interest to you.")

        if(df_dict['desc']):
            put_markdown(f"### {fs_fields_str['desc']}\n{df_dict['desc']}")

        
        for key in fs_icons_urls:
            if((key == 'agro_eco_zone' and df_dict[key] != '') or
                not math.isnan(df_dict[key])):
                put_image(fs_icons_urls[key], width='50px')
                put_markdown(f"**{fs_fields_str[key]}:** {df_dict[key]}")

                if(key == 'irrigated_area'): put_markdown(f"**{fs_fields_str['irrigated_rainfed']}:** {df_dict['irrigated_rainfed']}")

        df_landscape = get_fs_landscapes(dmr_label, fs_name)
        if(len(df_landscape.index) > 0):
            put_markdown("### Landscapes")
            put_markdown(f"The **{fs_name}** farming system takes place in the following **landscapes**")
            for landscape in df_landscape['landscape_name'].to_numpy():
                put_markdown(f" * {landscape}")

        put_markdown("### What else?\nThere are more information related to this farming system, click one of the following categories to extend the search.")

def get_fs_landscapes(dmr_label, fs_name):
    q = """
    %s

    select ?landscape_name ?landscape_desc
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?landscape a :Landscape ;
        :LandscapeName ?landscape_name .

        optional { ?landscape :LandscapeDescription ?landscape_desc } 

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :takesPlaceInLandscape ?landscape  .
    }
    """ % (q_prefix, fs_name, dmr_label)

    return sparql_dataframe.get(endpoint, q)

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('-p', '--port', default = 8080, type = int)

    args = parser.parse_args()
    start_server(app, port = args.port)