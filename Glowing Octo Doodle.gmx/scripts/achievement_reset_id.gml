 ///achievement_reset_id(id)
//collects an achievement

if(ds_map_exists(achievements, argument0)){
    if(ds_map_find_value(achievements[? argument0],  "activated") == 1) {
        ds_map_replace(achievements[? argument0], "activated", 0);
    }
}
