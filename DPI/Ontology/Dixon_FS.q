[QueryItem="Dixon MR with FS name"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?dmr_name ?fs_name
where{
   ?farming_system a :Farming_system ;
    :FSName ?fs_name .

   ?dixon_macro_region a :Dixon_macro_region ;
    :LocationName ?dmr_name .

   ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
}
[QueryItem="Farming System from DMR name"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?fs_name
where{
   ?farming_system a :Farming_system ;
    :FSName ?fs_name .

   ?dixon_macro_region a :Dixon_macro_region ;
    :LocationName "Sub-Saharan Africa" .

   ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
}
[QueryItem="Farming System from FS + DMR name"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?agri_pop ?agro_eco_zone ?cattle_pop ?cultivated_area ?desc ?farm_size ?irrigated_area ?irrigated_rainfed ?total_area ?total_pop
    where{
    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "EAP" .

    ?farming_system a :Farming_system ;
        :FSName "Lowland Rice" ;

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
[QueryItem="Landscapes from FS"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?landscape_name ?landscape_desc
where{
   ?farming_system a :Farming_system ;
    :FSName ?fs_name .

   ?dixon_macro_region a :Dixon_macro_region ;
       :DixonMRLabel ?mr_label .

   ?landscape a :Landscape ;
    :LandscapeName ?landscape_name .

    optional { ?landscape :LandscapeDescription ?landscape_desc } 

   ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
   ?farming_system :takesPlaceInLandscape ?landscape  .
}
[QueryItem="Countries from FS"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?country_name ?country_iso_alpha_3 ?intermediate_region_name ?sub_region_name ?region_name
where{
   ?farming_system a :Farming_system ;
    :FSName ?fs_name .

   ?dixon_macro_region a :Dixon_macro_region ;
       :DixonMRLabel ?mr_label .

   ?country a :Country ;
    :LocationName "Thailand" ;
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
[QueryItem="Expert involvements from FS"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?expert_first_name ?expert_middle_name ?expert_last_name ?expert_email ?expert_domain ?expert_org
where{
   ?farming_system a :Farming_system ;
    :FSName "Lowland Rice" .

   ?dixon_macro_region a :Dixon_macro_region ;
    :DixonMRLabel "EAP" .

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
[QueryItem="Livelihood sources from FS"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?ls_name
where{
   ?farming_system a :Farming_system ;
    :FSName "Lowland Rice" .

   ?dixon_macro_region a :Dixon_macro_region ;
    :DixonMRLabel "EAP" .

   ?livelihood_source a :Livelihood_source ;
    :LSName ?ls_name .

   ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
   ?farming_system :reliesOnLivelihoodSource ?livelihood_source .
}
[QueryItem="Commodities from livelihod source"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?c_name ?c_ncbi_taxo_name ?c_ncbi_taxo_id ?c_max_thi ?c_min_temp ?c_max_temp ?c_avg_temp ?c_min_prec ?c_max_prec ?c_avg_prec ?c_min_elev ?c_max_elev
where{
   ?farming_system a :Farming_system ;
    :FSName "Dryland mixed" .

   ?dixon_macro_region a :Dixon_macro_region ;
    :DixonMRLabel "LAC" .

   ?livelihood_source a :Livelihood_source ;
    :LSName "Agriculture" .

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
[QueryItem="Resources from commodity"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?resource_id ?resource_title ?resource_year ?resource_type ?resource_url
where{
   ?farming_system a :Farming_system ;
    :FSName "Dryland mixed" .

   ?dixon_macro_region a :Dixon_macro_region ;
    :DixonMRLabel "LAC" .

   ?livelihood_source a :Livelihood_source ;
    :LSName "Agriculture" .

   ?commodity a :Commodity ;
    :CommodityName "Cassava" .

   ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
   ?farming_system :reliesOnLivelihoodSource ?livelihood_source .
   ?livelihood_source :producesCommodity ?commodity .

   optional { ?commodity :sourcedFrom ?resource
	optional { ?resource :ResourceTitle ?resource_title }
	optional { ?resource :ResourceURL ?resource_url }

	?resource a :Resource ; 
  	 :ResourceID ?resource_id ;
	 :ResourceYear ?resource_year ;
	 :ResourceType ?resource_type .
    }
}
[QueryItem="Soils from commodity"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?soil_name ?soil_desc
    where{
    ?farming_system a :Farming_system ;
        :FSName "Coastal plantation and mixed" .

    ?dixon_macro_region a :Dixon_macro_region ;
        :DixonMRLabel "LAC" .

    ?livelihood_source a :Livelihood_source ;
        :LSName "Crops/tree crops export" .

    ?commodity a :Commodity ;
        :CommodityName "Coffee (Coffea arabica)" .

    ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
    ?farming_system :reliesOnLivelihoodSource ?livelihood_source .
    ?livelihood_source :producesCommodity ?commodity .

    optional { ?commodity :growsInSoil ?soil 
        optional { ?soil :SoilDescription ?soil_desc } 
        ?soil :SoilName ?soil_name
    }
}
[QueryItem="Farming System sourcing from FS"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?fs_field ?resource_id ?resource_title ?resource_year ?resource_type ?resource_url
where{
   ?farming_system a :Farming_system ;
    :FSName "Lowland Rice" .

   ?dixon_macro_region a :Dixon_macro_region ;
    :DixonMRLabel "EAP" .

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