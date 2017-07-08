///achievement_get(id)
//retrieves an achievement

if(ds_map_exists(achievements, argument0)){
    var ach = ds_map_create();
    ds_map_add(ach , "name", ds_map_find_value(achievements[? argument0], "name"));
    
    if(ds_map_find_value(achievements[? argument0], "secret") == 1) {
        ds_map_add(ach , "description", "???");
        ds_map_add(ach , "sprite", spr_achievement_secret);
        ds_map_add(ach , "secret", 1);
    } else {
        ds_map_add(ach , "description", ds_map_find_value(achievements[? argument0], "description"));
        ds_map_add(ach , "sprite", ds_map_find_value(achievements[? argument0], "sprite"));
        ds_map_add(ach , "secret", 0);
    }
    
    ds_map_add(ach , "activated", ds_map_find_value(achievements[? argument0], "activated"));

    return ach;
}
return false;
