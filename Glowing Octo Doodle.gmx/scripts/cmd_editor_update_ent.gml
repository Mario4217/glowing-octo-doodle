///cmd_editor_update_ent(args);
if (room == rm_editor){
  if (obj_editor.inst_selected != -1){
    if (instance_exists(obj_editor.inst_selected)){
      if (obj_editor.inst_selected.attr[? argument0[1]] != undefined){
        if (is_real(obj_editor.inst_selected.attr[? argument0[1]])){
          obj_editor.inst_selected.attr[? argument0[1]] = real(argument0[2]);
        }else{
          obj_editor.inst_selected.attr[? argument0[1]] = argument0[2];
        }
      }
    }
  }else if (obj_editor.inst_selected == -1){
    console_print("No entity is selected!",c_red);
  }
}else{
  console_print("You are not in the editor!",c_red);
}
