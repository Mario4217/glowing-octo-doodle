///editor_update(args);
if (room == rm_editor){
  obj_editor.world_width = ui_get_value(obj_editor.input_width);
  obj_editor.world_height = ui_get_value(obj_editor.input_height);
  obj_editor.world_name = string_trim(ui_get_value(obj_editor.input_name));
  obj_editor.world_players = ui_get_value(obj_editor.input_players);
}else{
  console_print("Can't update the editor from outside of the editor!",c_red);
}
