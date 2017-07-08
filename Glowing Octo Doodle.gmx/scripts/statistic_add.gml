///statistic_add(name, value)

if(!ds_map_exists(statistics, argument0)) {
    var stat = ds_map_create();
    ds_map_add(stat , "isavg", 0);
    ds_map_add(stat , "value", argument1);
    
    ds_map_add_map(statistics, argument0, stat);
}
