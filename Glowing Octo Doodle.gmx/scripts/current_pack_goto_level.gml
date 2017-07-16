///current_pack_goto_level(index);
if (current_pack != -1){
  var index = argument0;
  var maps = current_pack[? "maps"];
  if (index < ds_list_size(maps)){
    var map = maps[| index];
    current_pack[? "current_map_index"] = index;
    world_load(map[? "name"]);
  }else{
    ds_map_destroy(current_pack);
    current_pack = -1;
    world_load("title");
  }
}
