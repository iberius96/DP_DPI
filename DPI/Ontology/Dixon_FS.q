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

select ?country_name ?country_iso_alpha_3 ?country_m49 ?intermediate_region_name ?intermediate_region_m49 ?sub_region_name ?sub_region_m49 ?region_name ?region_m49
where{
   ?farming_system a :Farming_system ;
    :FSName ?fs_name .

   ?dixon_macro_region a :Dixon_macro_region ;
       :DixonMRLabel ?mr_label .

   ?country a :Country ;
    :LocationName ?country_name ;
    :CountryISOAlpha3 ?country_iso_alpha_3 ;
    :UNLocationM49 ?country_m49 .

   ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
   ?farming_system :foundInCountry ?country  .

   optional { ?country :countrySituatedInIR ?intermediate_region 
	optional { ?intermediate_region :UNLocationM49 ?intermediate_region_m49 }
	optional { ?intermediate_region :LocationName ?intermediate_region_name }
    }

   optional { ?country :countrySituatedInSubRegion ?sub_region 
	optional { ?sub_region :UNLocationM49 ?sub_region_m49 }
	optional { ?sub_region :LocationName ?sub_region_name }
    }

   optional { ?sub_region :subRegionSituatedInRegion ?region 
	optional { ?region :UNLocationM49 ?region_m49 }
	optional { ?region :LocationName ?region_name }
    }
}