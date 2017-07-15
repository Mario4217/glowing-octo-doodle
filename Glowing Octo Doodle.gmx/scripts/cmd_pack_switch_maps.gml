///cmd_pack_switch_maps(args)
if (room == rm_pack_editor){
  var index1 = real(argument0[1]);
  var index2 = real(argument0[2]);
  
  var list = obj_pack_editor.maps;
  
  if (index1 < ds_list_size(list) && index2 < ds_list_size(list)){
    var b = list[| index1];
    list[| index1] = list[| index2];
    list[| index2] = b;
  }
  
  pack_editor_reload_maps();
}
