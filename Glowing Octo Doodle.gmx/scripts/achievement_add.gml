///achievement_add(id, name, description, sprite , secret, activated)
//adds an achievement to the list of achievement

if(!ds_map_exists(achievements, argument0)){
    var ach = ds_map_create();
    ds_map_add(ach , "name", argument1);
    ds_map_add(ach , "description", argument2);
    ds_map_add(ach , "sprite", argument3);
    ds_map_add(ach , "secret", real(argument4));
    ds_map_add(ach , "activated", real(argument5));
    
    ds_map_add_map(achievements, argument0, ach);
}
