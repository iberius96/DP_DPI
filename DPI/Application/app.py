import sparql_dataframe
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
    'agri_pop': 'Agricultural population (M)', 
    'cattle_pop': 'Cattle population (M)', 
    'cultivated_area': 'Cultivated area (M ha)', 
    'farm_size': 'Farm size (M ha)', 
    'irrigated_area': 'Irrigated area (M ha)', 
    'irrigated_rainfed': 'Irrigate/Rainfed', 
    'total_area': 'Total area (M ha)', 
    'total_pop': 'Total population (M)'
}

commodity_icon_urls = {
    'c_max_thi': 'https://cdn-icons-png.flaticon.com/512/1585/1585362.png',
    'c_temp': 'https://cdn-icons-png.flaticon.com/512/1843/1843544.png',
    'c_prec': 'https://cdn-icons-png.flaticon.com/512/3506/3506148.png',
    'c_elev': 'https://cdn-icons-png.flaticon.com/512/6800/6800574.png'
}

commodity_fields_str = {
    'c_max_thi': 'Max THI',
    'c_temp': 'Temperatures (°C)',
    'c_prec': 'Precipitations (mm)',
    'c_elev': 'Elevation (masl)'
}

connection_fields_str = {
    'c_from': 'From',
    'c_link_type': 'Link type',
    'c_to': 'To',
    'c_desc': 'Description',
    'c_tag': 'Tags'
}

factor_fields_str = {
    'f_label': 'Factor',
    'f_type_1': 'Type-1 label'
}

curr_fs = {}
active_scopes = set()

def app():
    active_scopes.clear()

    put_markdown('# Let\'s explore some Farming Systems')

    with use_scope('dmr_scope'):
        put_markdown('Here you have all available **macro regions**, select the one you are interested in.')
        get_formatted_dmr()

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

    curr_fs['dmr_label'] = dmr_label
    curr_fs['fs_name'] = fs_name

    remove('what_else')
    clear('dmr_scope')
    with use_scope('fs_scope', clear=True):
        put_markdown(f"Here are some details of the **{fs_name}** farming system that might be of interest to you.")

        build_experts_scope()

        if(df_dict['desc']):
            put_markdown(f"### {fs_fields_str['desc']}\n{df_dict['desc']}")

        idx = 0
        row_items = []
        for key in fs_icons_urls:
            if(idx % 2 == 0): 
                if(len(row_items) > 0): put_row(row_items)
                row_items = []
            if((key == 'agro_eco_zone' and df_dict[key] != 'nan') or not math.isnan(df_dict[key])):
                image_text_pair = []
                image_text_pair.append([put_image(fs_icons_urls[key], width='50px')])
                image_text_pair.append([put_markdown(f"**{fs_fields_str[key]}:** {df_dict[key] if isinstance(df_dict[key], str) else int(df_dict[key]) if df_dict[key].is_integer() else df_dict[key]}")])
                if(key == 'irrigated_area'): image_text_pair.append([put_markdown(f"**{fs_fields_str['irrigated_rainfed']}:** {df_dict['irrigated_rainfed']}")])
                row_items.append(put_grid(image_text_pair))
                idx += 1
        if(len(row_items) > 0): put_row(row_items)

        df_resources = get_grouped_fs_field_resources()
        resources_collapse_content_list = []
        for i in range(len(df_resources)):
            resources_dict = df_resources.iloc[i].to_dict()
            if(str(resources_dict['fs_field']) != 'nan'): resources_collapse_content_list.append(put_markdown(f"#### {', '.join(map(str, resources_dict['fs_field']))}"))
            if(str(resources_dict['resource_id']) != 'nan'): resources_collapse_content_list.append(put_markdown(f"**{resources_dict['resource_id']} ({resources_dict['resource_year']}, {resources_dict['resource_type']})**"))
            if(str(resources_dict['resource_title']) != 'nan'): resources_collapse_content_list.append(put_markdown(f"*\"{resources_dict['resource_title']}\"*"))
            if(str(resources_dict['resource_url']) != 'nan'): resources_collapse_content_list.append(put_markdown(resources_dict['resource_url']))
        if(len(resources_collapse_content_list) > 0): put_collapse('Resources', resources_collapse_content_list)

        df_landscape = get_fs_landscapes()
        if(len(df_landscape.index) > 0):
            put_markdown("### Landscapes")
            put_markdown(f"The **{fs_name}** farming system takes place in the following **landscapes**")
            for landscape in df_landscape['landscape_name'].to_numpy():
                put_markdown(f" * {landscape}")
    build_what_else_scope()

def build_experts_scope():
    q = """
    %s

    select ?expert_first_name ?expert_middle_name ?expert_last_name ?expert_email ?expert_domain ?expert_org
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?expert_inv a :Expert_involvement ;
        :ExpertInvDomain ?expert_domain .

    ?expert a :Expert ;
        :ExpertFirstName ?expert_first_name ;
        :ExpertLastName ?expert_last_name ;
        :ExpertEmail ?expert_email ;
        :ExpertOrganisation ?expert_org .

    optional { ?expert :ExpertMiddleName ?expert_middle_name }

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?expert_inv :involvementInFarmingSystem ?farming_system .
    ?expert_inv :involvementByExpert ?expert .
    }
    """ % (q_prefix, curr_fs['fs_name'], curr_fs['dmr_label'])
    df_experts = sparql_dataframe.get(endpoint, q)

    if(len(df_experts) > 0):
        put_markdown("### Involved experts")
        for i in range(len(df_experts)):
            put_markdown(f"**{df_experts.loc[i, 'expert_domain']}:** {df_experts.loc[i, 'expert_last_name']}, {df_experts.loc[i, 'expert_first_name']} ({df_experts.loc[i, 'expert_email']})")
            put_markdown(f"*{df_experts.loc[i, 'expert_org']}*")

def build_countries_scope():
    q = """
    %s

    select ?country_name ?country_iso_alpha_3 ?intermediate_region_name ?sub_region_name ?region_name
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?country a :Country ;
        :LocationName ?country_name ;
        :CountryISOAlpha3 ?country_iso_alpha_3 .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :foundInCountry ?country  .

    optional { ?country :countrySituatedInIR ?intermediate_region 
        optional { ?intermediate_region :LocationName ?intermediate_region_name }
        }

    optional { ?country :countrySituatedInSubRegion ?sub_region 
        optional { ?sub_region :LocationName ?sub_region_name }
        }

    optional { ?sub_region :subRegionSituatedInRegion ?region 
        optional { ?region :LocationName ?region_name }
        }
    }
    """ % (q_prefix, curr_fs['fs_name'], curr_fs['dmr_label'])

    remove('what_else')
    with use_scope('countries', clear=True):
        active_scopes.add('countries')
        df_countries = sparql_dataframe.get(endpoint, q)
        df_countries['Country'] = df_countries['country_name'] + ' (' + df_countries['country_iso_alpha_3'] + ')'
        df_countries.rename(columns={'intermediate_region_name': 'Intermediate region', 'sub_region_name': 'Sub-region', 'region_name': 'Region'}, inplace = True)
        df_countries = df_countries[['Country', 'Intermediate region', 'Sub-region', 'Region']]

        put_markdown("# Countries\nHere are the countries associated with the farming system.")
        build_input_search(target_scope='countries', target_df=df_countries, target_field='Country', placeholder_str='Search country')
        with use_scope('countries_table'): 
            put_html(df_countries.to_html(border=0))
        build_hide_section_button('countries')
    build_what_else_scope()

def build_ls_scope():
    q = """
    %s

    select ?ls_name
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?livelihood_source a :Livelihood_source ;
        :LSName ?ls_name .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :reliesOnLivelihoodSource ?livelihood_source .
    }
    """ % (q_prefix, curr_fs['fs_name'], curr_fs['dmr_label'])

    remove('what_else')
    with use_scope('livelihood_sources', clear=True):
        active_scopes.add('livelihood_sources')
        df_ls = sparql_dataframe.get(endpoint, q)

        put_markdown("# Livelihood sources\nThe farming system relies on the following **livelihood sources** (and related **commodities**).")
        for i in range(len(df_ls)): put_markdown(f"* {df_ls.loc[i, 'ls_name']}")

        for i in range(len(df_ls)):
            build_related_commodities(df_ls.loc[i, 'ls_name'])

        build_hide_section_button('livelihood_sources')
    build_what_else_scope()

def build_related_commodities(ls_name):
    q = """
    %s

    select ?c_name ?c_ncbi_taxo_name ?c_ncbi_taxo_id ?c_max_thi ?c_min_temp ?c_max_temp ?c_avg_temp ?c_min_prec ?c_max_prec ?c_avg_prec ?c_min_elev ?c_max_elev
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?livelihood_source a :Livelihood_source ;
        :LSName "%s" .

    ?commodity a :Commodity ;
        :CommodityName ?c_name .

        optional { ?commodity :CommodityNCBITaxonomyName ?c_ncbi_taxo_name }
        optional { ?commodity :CommodityNCBITaxonomyID ?c_ncbi_taxo_id }
        optional { ?commodity :CommodityMaxTHI ?c_max_thi }
        optional { ?commodity :CommodityMinTemperature ?c_min_temp }
        optional { ?commodity :CommodityMaxTemperature ?c_max_temp }
        optional { ?commodity :CommodityAverageTemperature ?c_avg_temp }
        optional { ?commodity :CommodityMinPrecipitation ?c_min_prec }
        optional { ?commodity :CommodityMaxPrecipitation ?c_max_prec }
        optional { ?commodity :CommodityAvgPrecipitation ?c_avg_prec }
        optional { ?commodity :CommodityMinElevation ?c_min_elev }
        optional { ?commodity :CommodityMaxElevation ?c_max_elev }

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :reliesOnLivelihoodSource ?livelihood_source .
    ?livelihood_source :producesCommodity ?commodity .
    }
    """ % (q_prefix, curr_fs['fs_name'], curr_fs['dmr_label'], ls_name)

    df_commodities = sparql_dataframe.get(endpoint, q)
    df_commodities['c_temp'] = df_commodities['c_min_temp'].astype(str) + '-' + df_commodities['c_max_temp'].astype(str) + " (Avg:" + df_commodities['c_avg_temp'].astype(str) + ")"
    df_commodities['c_prec'] = df_commodities['c_min_prec'].astype(str) + '-' + df_commodities['c_max_prec'].astype(str) + " (Avg:" + df_commodities['c_avg_prec'].astype(str) + ")"
    df_commodities['c_elev'] = df_commodities['c_min_elev'].astype(str) + '-' + df_commodities['c_max_elev'].astype(str)
    if(len(df_commodities) > 0): put_markdown(f"## {ls_name}")

    tab_dicts = []
    for i in range(len(df_commodities)):
        tab_dict = {}
        tab_content_list = []

        commodity_dict = df_commodities.iloc[i].to_dict()

        if(str(commodity_dict['c_ncbi_taxo_name']) != 'nan'): tab_content_list.append(put_markdown(f"**NCBI taxonomy name**: {commodity_dict['c_ncbi_taxo_name']}"))

        for key in commodity_icon_urls:
            cleaned_str = str(commodity_dict[key]).replace('(Avg:nan)', '').replace('nan-nan','').replace('.0','')
            if(cleaned_str.replace(' ', '') != '' and cleaned_str.replace(' ', '') != 'nan'):
                tab_content_list.append(put_image(commodity_icon_urls[key], width='50px'))
                tab_content_list.append(put_markdown(f"**{commodity_fields_str[key]}:** {cleaned_str}"))
        if(len(tab_content_list) == 0): tab_content_list.append(put_markdown('No info to show for this commodity.'))

        df_soils = get_commodity_soils(ls_name, commodity_dict['c_name'])
        soils_collapse_content_list = []
        for i in range(len(df_soils)):
            soils_dict = df_soils.iloc[i].to_dict()
            if(str(soils_dict['soil_name']) != 'nan'): soils_collapse_content_list.append(put_markdown(f"**{soils_dict['soil_name']}**"))
            if(str(soils_dict['soil_desc']) != 'nan'): soils_collapse_content_list.append(put_markdown(soils_dict['soil_desc']))
        if(len(soils_collapse_content_list) > 0): tab_content_list.append(put_collapse('Soils', soils_collapse_content_list))

        resources_collapse_content_list = build_resource_collapse_content_list(get_resources('commodity', get_commodity_query_fragment(ls_name, commodity_dict['c_name'])))
        if(len(resources_collapse_content_list) > 0): tab_content_list.append(put_collapse('Resources', resources_collapse_content_list))
        tab_dict['content'] = tab_content_list
        tab_dict['title'] = commodity_dict['c_name']
        tab_dicts.append(tab_dict)
    if(len(tab_dicts) > 0): put_tabs(tab_dicts)

def build_icm_scope():
    icm_query_fragment = """
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?icm a :Impact_chain_model ;
        :ICMDescription ?icm_desc .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :subjectToICM ?icm  .
    """ % (curr_fs['fs_name'], curr_fs['dmr_label'])

    q = """
    %s

    select ?icm_desc
    %s
    }
    """ % (q_prefix, icm_query_fragment)

    remove('what_else')
    with use_scope('icm', clear=True):
        active_scopes.add('icm')
        df_icm = sparql_dataframe.get(endpoint, q).iloc[0].to_dict()

        put_markdown("# Impact chain model")
        put_markdown(df_icm['icm_desc'])
        resources_collapse_content_list = build_resource_collapse_content_list(get_resources('icm', icm_query_fragment))
        if(len(resources_collapse_content_list) > 0): put_collapse('Resources', resources_collapse_content_list)
        put_tabs([
            {'title': 'Factors', 'content': [put_scrollable(put_scope('factor_scrollable'), height=800)]},
            {'title': 'Connections', 'content': [put_scrollable(put_scope('connection_scrollable'), height=800)]}])
        build_connection_tab()
        build_factor_tab()

        build_hide_section_button('icm')
    build_what_else_scope()

def build_connection_tab():
    q = """
    %s

    select ?c_id ?c_from ?c_link_type ?c_to ?c_desc ?c_tag
    %s
    }
    """ % (q_prefix, get_connection_query_fragment())
    
    df_connection = sparql_dataframe.get(endpoint, q)
    df_connection = df_connection.groupby(by=['c_id','c_from','c_link_type','c_to','c_desc']).agg({'c_tag': list}).reset_index()
    build_input_search(target_scope='connection_scrollable', target_df=df_connection, target_field='c_from', placeholder_str='Search connections', select_fields=list(connection_fields_str.values()))
    put_scope('connection_scrollable_table', scope='connection_scrollable') # Required for search scope refresh
    build_connection_table(df_connection)

def build_factor_tab():
    q = """
    %s

    select ?f_label ?f_type_1
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?factor a :Factor ;
        :FactorLabel ?f_label ;
        :FactorType-1 ?f_type_1 .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :subjectToICM ?icm  .
    ?icm :characterisedByFactor ?factor .
    }
    """ % (q_prefix, curr_fs['fs_name'], curr_fs['dmr_label'])

    df_factor = sparql_dataframe.get(endpoint, q)
    build_input_search(target_scope='factor_scrollable', target_df=df_factor, target_field='f_label', placeholder_str='Search factors', select_fields=list(factor_fields_str.values()))
    put_scope('factor_scrollable_table', scope='factor_scrollable') # Required for search scope refresh
    build_factor_table(df_factor)

def build_connection_table(df_connection):
    with use_scope('connection_scrollable_table', clear=True):
        for i in range(len(df_connection)):
            connection_dict = df_connection.iloc[i].to_dict()
            if(str(connection_dict['c_from']) != 'nan'): put_markdown(f"### {connection_dict['c_from']} → {connection_dict['c_link_type']} → {connection_dict['c_to']}")
            if(str(connection_dict['c_desc']) != 'nan'): put_markdown(f"**Description**\n{connection_dict['c_desc']}")
            if(len(connection_dict['c_tag']) > 0): put_markdown(f"**Tags:** {', '.join(map(str, connection_dict['c_tag']))}")

            resources_collapse_content_list = build_resource_collapse_content_list(get_resources('connection', get_connection_query_fragment(by_id=True, id=connection_dict['c_id'])))
            if(len(resources_collapse_content_list) > 0): put_collapse('Resources', resources_collapse_content_list)

            put_markdown("\n---\n")

def build_factor_table(df_factor):
    with use_scope('factor_scrollable_table', clear=True):
        for i in range(len(df_factor)):
            factor_dict = df_factor.iloc[i].to_dict()
            if(str(factor_dict['f_label']) != 'nan'): put_markdown(f"### {factor_dict['f_label']}")
            if(str(factor_dict['f_type_1']) != 'nan'): put_markdown(f"**Type-1 label:** {factor_dict['f_type_1']}")
            if(str(factor_dict['f_label']) != 'nan'): build_factor_descriptors_collapse(factor_dict['f_label'], factor_dict['f_type_1'])
            if(str(factor_dict['f_label']) != 'nan'): build_factor_connections_collapse(factor_dict['f_label'])
            put_markdown("\n---\n")

def build_factor_descriptors_collapse(factor_label, factor_type_1):
    q = """
    %s

    select ?fd_id ?fd_desc ?fd_type_2 ?fd_tag
    %s
    }
    """ % (q_prefix, get_factor_descriptor_query_fragment(factor_label, factor_type_1))

    factor_descriptors_df = sparql_dataframe.get(endpoint, q)
    factor_descriptors_df = factor_descriptors_df.groupby(by=['fd_id','fd_desc']).agg({'fd_type_2': set, 'fd_tag': set}).reset_index()
    collapse_content_list = []
    for i in range(len(factor_descriptors_df)):
            factor_descriptors_dict = factor_descriptors_df.iloc[i].to_dict()
            if(str(factor_descriptors_dict['fd_type_2']) != 'nan'): collapse_content_list.append(put_markdown(f"**Type-2 label(s):** {', '.join(map(str, factor_descriptors_dict['fd_type_2']))}"))
            if(str(factor_descriptors_dict['fd_tag']) != 'nan'): collapse_content_list.append(put_markdown(f"**Tag(s):** {', '.join(map(str, factor_descriptors_dict['fd_tag']))}"))
            if(str(factor_descriptors_dict['fd_desc']) != 'nan'): collapse_content_list.append(put_markdown(f"**Description:**\n {factor_descriptors_dict['fd_desc']}"))
            resources_collapse_content_list = build_resource_collapse_content_list(get_resources('factor_descriptor', get_factor_descriptor_query_fragment(factor_label, factor_type_1, by_id=True, id=factor_descriptors_dict['fd_id'])))
            if(len(resources_collapse_content_list) > 0): collapse_content_list.append(put_collapse('Resources', resources_collapse_content_list))

    if(len(collapse_content_list) > 0): put_collapse('Related descriptor(s)', collapse_content_list, scope='factor_scrollable_table')

def build_factor_connections_collapse(factor_label):
    q = """
    %s

    select distinct ?c_from ?c_link_type ?c_to
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :subjectToICM ?icm  .
    ?icm :characterisedByFactor ?factor .
    ?icm :describedByConnection ?connection .

    optional {
        ?connection a :Connection ;
        :ConnectionFrom ?c_from ;
        :ConnectionLinkType ?c_link_type ;
        :ConnectionTo ?c_to ;
        :ConnectionTo "%s" .
    }

    optional {
        ?connection a :Connection ;
        :ConnectionFrom ?c_from ;
        :ConnectionFrom "%s" ;
        :ConnectionLinkType ?c_link_type ;
        :ConnectionTo ?c_to .
    }
    }
    """ % (q_prefix, curr_fs['fs_name'], curr_fs['dmr_label'], factor_label, factor_label)

    factor_connections_df = sparql_dataframe.get(endpoint, q)
    collapse_content_list = []
    for i in range(len(factor_connections_df)):
            factor_connections_dict = factor_connections_df.iloc[i].to_dict()
            if(str(factor_connections_dict['c_from']) != 'nan'): collapse_content_list.append(put_markdown(f"{factor_connections_dict['c_from']} → {factor_connections_dict['c_link_type']} → {factor_connections_dict['c_to']}"))
    if(len(collapse_content_list) > 0): put_collapse('Related connection(s)', collapse_content_list, scope='factor_scrollable_table')

def get_commodity_soils(ls_name, commodity_name):
    q = """
    %s

    select ?soil_name ?soil_desc
    %s

    optional { ?commodity :growsInSoil ?soil 
        optional { ?soil :SoilDescription ?soil_desc } 
        ?soil :SoilName ?soil_name
        }
    }
    """ % (q_prefix, get_commodity_query_fragment(ls_name, commodity_name))

    return sparql_dataframe.get(endpoint, q)

def get_commodity_query_fragment(ls_name, commodity_name):
    q = """
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?livelihood_source a :Livelihood_source ;
        :LSName "%s" .

    ?commodity a :Commodity ;
        :CommodityName "%s" .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :reliesOnLivelihoodSource ?livelihood_source .
    ?livelihood_source :producesCommodity ?commodity .
    """ % (curr_fs['fs_name'], curr_fs['dmr_label'], ls_name, commodity_name)
    return q

def get_factor_descriptor_query_fragment(factor_label, factor_type_1, by_id=False, id=0):
    if(by_id):
        q = """
        where{
        ?factor_descriptor a :Factor_descriptor ;
            :FDId %s .
        """ % (id)
    else:
        q = """
        where{
        ?farming_system a :Farming_system ;
            :FSName "%s" .

        ?dixon_macro_region a :Dixon_macro_region ;
            :DixonMRLabel "%s" .

        ?factor a :Factor ;
            :FactorLabel "%s" ;
            :FactorType-1 "%s" .

        ?factor_descriptor a :Factor_descriptor ;
            :FDId ?fd_id ;
            :FDDescription ?fd_desc ;
            :FDType-2 ?fd_type_2 ;
            :FDTag ?fd_tag .

        ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
        ?farming_system :subjectToICM ?icm  .
        ?icm :characterisedByFactor ?factor .
        ?factor :describedByFD ?factor_descriptor .
        """ % (curr_fs['fs_name'], curr_fs['dmr_label'], factor_label, factor_type_1)
    return q

def get_connection_query_fragment(by_id=False, id=0):
    if(by_id):
        q = """
        where{
        ?connection a :Connection ;
            :ConnectionId %s ;
        """ % (id)
    else:
        q = """
        where{
        ?farming_system a :Farming_system ;
            :FSName "%s" .

        ?dixon_macro_region a :Dixon_macro_region ;
            :DixonMRLabel "%s" .

        ?connection a :Connection ;
            :ConnectionId ?c_id ;
            :ConnectionFrom ?c_from ;
            :ConnectionLinkType ?c_link_type ;
            :ConnectionTo ?c_to .

            optional { ?connection :ConnectionDescription ?c_desc }
            optional { ?connection :ConnectionTag ?c_tag }

        ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
        ?farming_system :subjectToICM ?icm  .
        ?icm :describedByConnection ?connection .
        """ % (curr_fs['fs_name'], curr_fs['dmr_label'])
    return q

def get_fs_landscapes():
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
    """ % (q_prefix, curr_fs['fs_name'], curr_fs['dmr_label'])

    return sparql_dataframe.get(endpoint, q)

def get_grouped_fs_field_resources():
    q = """
    %s

    select ?fs_field ?resource_id ?resource_title ?resource_year ?resource_type ?resource_url
    where{
    ?farming_system a :Farming_system ;
        :FSName "%s" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "%s" .

    ?fs_sourcing a :Farming_system_sourcing ;
        :FSSourcingField ?fs_field .

    ?resource a :Resource ; 
        :ResourceID ?resource_id ;
        :ResourceYear ?resource_year ;
        :ResourceType ?resource_type .

    optional { ?resource :ResourceTitle ?resource_title }
    optional { ?resource :ResourceURL ?resource_url }

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?fs_sourcing :sourcedForFSField ?farming_system .
    ?fs_sourcing :sourcedFrom ?resource .
    }
    """ % (q_prefix, curr_fs['fs_name'], curr_fs['dmr_label'])

    df_resources = sparql_dataframe.get(endpoint, q)
    return df_resources.groupby(by=['resource_id','resource_title','resource_year','resource_type','resource_url']).agg({'fs_field': list}).reset_index()

def get_resources(sourced_element, query_fragment):
    q = """
    %s

    select ?resource_id ?resource_title ?resource_year ?resource_type ?resource_url
    %s

    optional { ?%s :sourcedFrom ?resource
        optional { ?resource :ResourceTitle ?resource_title }
        optional { ?resource :ResourceURL ?resource_url }

        ?resource a :Resource ; 
        :ResourceID ?resource_id ;
        :ResourceYear ?resource_year ;
        :ResourceType ?resource_type .
        }
    }
    """ % (q_prefix, query_fragment, sourced_element)

    return sparql_dataframe.get(endpoint, q)

def build_resource_collapse_content_list(df_resources):
    resources_collapse_content_list = []
    for i in range(len(df_resources)):
        resources_dict = df_resources.iloc[i].to_dict()
        if(str(resources_dict['resource_id']) != 'nan'): resources_collapse_content_list.append(put_markdown(f"**{resources_dict['resource_id']} ({resources_dict['resource_year']}, {resources_dict['resource_type']})**"))
        if(str(resources_dict['resource_title']) != 'nan'): resources_collapse_content_list.append(put_markdown(f"*\"{resources_dict['resource_title']}\"*"))
        if(str(resources_dict['resource_url']) != 'nan'): resources_collapse_content_list.append(put_markdown(resources_dict['resource_url']))
    return resources_collapse_content_list

def build_what_else_scope():
    remove('what_else')
    with use_scope('what_else'):
        put_markdown("# What else?\nThere are more information related to this farming system, click one of the following categories to extend the search.")
        if('countries' not in active_scopes): put_button('Related countries', onclick=lambda: build_countries_scope(), color = 'light', outline = False)
        if('livelihood_sources' not in active_scopes): put_button('Livelihood sources', onclick=lambda: build_ls_scope(), color = 'light', outline = False)
        if('icm' not in active_scopes): put_button('Impact chain model', onclick=lambda: build_icm_scope(), color = 'light', outline = False)

def build_hide_section_button(scope_id):
    put_button('Hide section', onclick=lambda l_scope_id = scope_id: hide_scope(l_scope_id), color = 'light', outline = False)

def hide_scope(scope_id):
    remove(scope_id)
    active_scopes.remove(scope_id)
    build_what_else_scope()

def build_input_search(target_scope, target_df, target_field, placeholder_str, select_fields=[]):
    row_elements = []
    row_elements.append(put_input(target_scope + '_search', placeholder=placeholder_str, scope=target_scope))
    if(len(select_fields) > 0): row_elements.append(put_select(target_scope + '_select', select_fields, scope=target_scope))
    field_str = connection_fields_str if target_scope == 'connection_scrollable' else factor_fields_str
    row_elements.append(put_button('Search', onclick=lambda l_target_scope = target_scope,
                                        l_target_df = target_df,
                                        l_target_field = target_field: filter_table(l_target_scope, 
                                                                                    l_target_df, 
                                                                                    [key for key,val in field_str.items() if val == pin[target_scope + '_select']][0] if len(select_fields) > 0 else l_target_field, 
                                                                                    pin[target_scope + '_search']), 
                                                                                    scope=target_scope))
    put_row(row_elements, scope=target_scope)

def filter_table(target_scope, target_df, target_field, field_val):
    if(field_val): 
        filtered_df = target_df[target_df[target_field].astype(str).str.contains(field_val, na = False, case = False)]
    else: filtered_df = target_df
    if(target_scope == 'countries'): 
        with use_scope(target_scope + '_table', clear=True): put_html(filtered_df.to_html(border=0))
    elif(target_scope == 'connection_scrollable'): build_connection_table(filtered_df)
    elif(target_scope == 'factor_scrollable'): build_factor_table(filtered_df)

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('-p', '--port', default = 8080, type = int)

    args = parser.parse_args()
    start_server(app, port = args.port, auto_open_webbrowser=True)