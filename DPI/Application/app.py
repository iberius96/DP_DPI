import numpy as np
import pandas as pd
import sparql_dataframe
import copy

from argparse import ArgumentParser
from pywebio import *
from pywebio.input import *
from pywebio.output import *
from pywebio.pin import *

endpoint = "http://localhost:8080/sparql"
q_prefix = "PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>"

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
        put_markdown(f"You have selected **{dmr_name} ({dmr_label})**.\nHere are the farming systems that are found in this macro region")
    
    with use_scope('fs_scope'):
            for fs_name in get_fs_names_from_dmr(dmr_name):
                put_markdown(f"  * {fs_name}")

def get_fs_names_from_dmr(dmr_name):
    q = """
    %s

    select ?fs_name
    where{
    ?farming_system a :Farming_system ;
        :FSName ?fs_name .

    ?dixon_macro_region a :Dixon_macro_region ;
        :LocationName "%s" .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    }
    """ % (q_prefix, dmr_name)

    return sparql_dataframe.get(endpoint, q)['fs_name'].to_numpy()

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('-p', '--port', default = 8080, type = int)

    args = parser.parse_args()
    start_server(app, port = args.port)