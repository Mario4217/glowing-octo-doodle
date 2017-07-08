///statistic_set_avg(name, session_count, session_length)

if(ds_map_exists(statistics, argument0)) {
    if(ds_map_find_value(statistics[? argument0], "isavg") == 1) {
        
        var value = ds_map_find_value(statistics[? argument0], "value");
        var time = ds_map_find_value(statistics[? argument0], "time");
        
        var time_window = ds_map_find_value(statistics[? argument0], "time_window");
        
        if(time + argument2 > time_window) {
            value = (value / time) * (time_window - argument2);
            time = time_window - argument2;
            
            ds_map_replace(statistics[? argument0] , "value", value + argument1);
            ds_map_replace(statistics[? argument0] , "time", time + argument2);
        } else {
            ds_map_replace(statistics[? argument0] , "value", value + argument1);
            ds_map_replace(statistics[? argument0] , "time", time + argument2);
        }
    }
}
