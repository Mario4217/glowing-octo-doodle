///current_pack_goto_level(index);
if (current_pack != -1){
  var index = argument0;
  var maps = current_pack[? "maps"];
  if (maps != undefined){ //is undefined, when client on networking
    if (index < ds_list_size(maps)){
      var map = maps[| index];
      current_pack[? "current_map_index"] = index;
      world_load(map[? "name"]);
    }
  }else{
    if (is_network){
      nw_end();
    }
    ds_map_destroy(current_pack);
    current_pack = -1;
    world_load("title");
  }
}
