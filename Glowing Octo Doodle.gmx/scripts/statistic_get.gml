///statistic_get(name)

if(ds_map_exists(statistics ,argument0)) {
    if(ds_map_find_value(statistics[? argument0], "isavg") == 0) {
        return ds_map_find_value(statistics[? argument0] , "value");
    } else if(ds_map_find_value(statistics[? argument0], "isavg") == 1) {
        return ds_map_find_value(statistics[? argument0] , "value") / ds_map_find_value(statistics[? argument0] , "time");
    }
}
return false;
