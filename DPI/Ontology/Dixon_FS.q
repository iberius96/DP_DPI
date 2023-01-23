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