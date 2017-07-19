///cmd_editor_destroy(args);
if (room == rm_editor){
  if (obj_editor.inst_selected != -1){
    if (instance_exists(obj_editor.inst_selected)){
      with(obj_editor.inst_selected){
        instance_destroy();
        world_update_region(bbox_left,bbox_top,bbox_right,bbox_bottom);
      }
    }
    obj_editor.inst_selected = -1;
  }else if (obj_editor.inst_selected == -1){
    console_print("No entity is selected!",c_red);
  }
}else{
  console_print("You are not in the editor!",c_red);
}
