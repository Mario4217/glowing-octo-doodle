///cmd_editor_end_link(args);
if (room == rm_editor){
  obj_editor.linkmode = false;
  var action = real(argument0[1]);
  var map = ds_map_create();
  map[? "event"] = obj_editor.linkevent;
  map[? "source"] = obj_editor.linksource;
  map[? "action"] = action
  map[? "target"] = obj_editor.linktarget;
  ds_list_add(obj_editor.linksource.outputs, map);
  //ds_list_mark_as_map(obj_editor.linksource.outputs,ds_list_find_index(obj_editor.linksource.outputs, map));
  ds_list_add(obj_editor.linktarget.inputs, map);
  //ds_list_mark_as_map(obj_editor.linktarget.inputs,ds_list_find_index(obj_editor.linktarget.inputs, map));
  
  console_command_execute("editor_logic");
}
