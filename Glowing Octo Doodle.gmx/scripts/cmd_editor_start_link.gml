///cmd_editor_start_link(args);
if (room == rm_editor){
  obj_editor.linkmode = true;
  obj_editor.linksource = obj_editor.inst_selected;
  obj_editor.linkevent = real(argument0[1]);
}
