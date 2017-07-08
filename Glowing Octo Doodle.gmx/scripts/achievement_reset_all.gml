///achievement_reset_all()
//collects an achievement

var key = ds_map_find_first(achievements);
var size = ds_map_size(achievements);

for (var i = 0; i < size; i++){
    
    if(ds_map_find_value(achievements[? key],  "activated") == 1) {
        ds_map_replace(achievements[? key], "activated", 0);
    }
    key = ds_map_find_next(achievements, key);

}
