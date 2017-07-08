///statistic_add_avg(name, value, time, time_window)

if(!ds_map_exists(statistics, argument0)) {
    var stat = ds_map_create();
    ds_map_add(stat , "isavg", 1);
    ds_map_add(stat , "value", argument1);
    ds_map_add(stat , "time", argument2);
    ds_map_add(stat , "time_window", argument3);
    
    ds_map_add_map(statistics, argument0, stat);
}
