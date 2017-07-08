///achievement_remove(id)
//removes an achievement from the list of achievement

if(ds_map_exists(achievements, argument0)){
    ds_map_delete(achievements, argument0);
}
