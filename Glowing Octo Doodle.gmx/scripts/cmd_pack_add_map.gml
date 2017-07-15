///cmd_pack_add_map(args)
if (room == rm_pack_editor){
  var map = get_level_data(argument0[1]);
  if (map){
    ds_list_add(obj_pack_editor.maps, map);
  }
  obj_pack_editor.map_dialog[? "visible"] = false;
  pack_editor_reload_maps();
}
