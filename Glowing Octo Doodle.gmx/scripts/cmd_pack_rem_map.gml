///cmd_pack_rem_map(args)
if (room == rm_pack_editor){
  var name = argument0[1];
  for (var i=0; i<ds_list_size(obj_pack_editor.maps); i+=1){
    var map = obj_pack_editor.maps[| i];
    if (map[? "name"] == name){
      ds_list_delete(obj_pack_editor.maps, i);
      break;
    }
  };
  
  pack_editor_reload_maps();
}
