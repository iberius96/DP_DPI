[QueryItem="Factor descriptor"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?id ?description ?tag
where{
   ?id a :Factor_descriptor ;
    :FDDescription ?description ;
    :FDTag ?tag .
}
[QueryItem="Farming System"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?farming_system ?name ?agro_ecological_zone ?total_area ?cultivated_area
where{
   ?farming_system a :Farming_system ;
    :FSName ?name ; 
    :FSAgroEcologicalZone ?agro_ecological_zone ; 
    :FSTotalArea ?total_area ; 
    :FSCultivatedArea ?cultivated_area .
}
[QueryItem="hostsFS"]
PREFIX : <http://www.semanticweb.org/samueleceol/ontologies/2023/0/untitled-ontology-23#>

select ?dixon_macro_region ?dmr_name ?farming_system ?fs_name
where{
   ?farming_system a :Farming_system ;
    :FSName ?fs_name .

   ?dixon_macro_region a :Dixon_macro_region ;
    :LocationName ?dmr_name .

   ?dixon_macro_region :hostsFarmingSystem ?farming_system  .
}