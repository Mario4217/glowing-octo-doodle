///get_level_data(level)
for (var i=0; i<ds_list_size(map_list); i+=1){
  var map = map_list[| i];
  if (map[? "name"] == argument0){
    return map;
  }
};
return false;
