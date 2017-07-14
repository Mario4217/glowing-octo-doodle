///cmd_editor_cut_link(args);
if (room == rm_editor){
  if (obj_editor.inst_selected != -1){
    var index = real(argument0[1]);
    var outputs = obj_editor.inst_selected.outputs;
    if (index < ds_list_size(outputs)){
      var map = outputs[| index];
      ds_list_delete(outputs, index);
      ds_list_delete(map[? "target"].inputs, ds_list_find_index(map[? "target"].inputs, map));
      ds_map_destroy(map);
    }
    console_command_execute("editor_logic");
  }
}
