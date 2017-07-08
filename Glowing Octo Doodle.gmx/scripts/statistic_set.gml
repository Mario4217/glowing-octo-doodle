///statistic_set(name, value)

if(ds_map_exists(statistics, argument0)) {
    if(ds_map_find_value(statistics[? argument0], "isavg") == 0) {
        ds_map_replace(statistics[? argument0] , "value", argument1);
    }
}
