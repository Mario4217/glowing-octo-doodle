///editor_load(puzzle name)
if (room == rm_editor){
  var path = "editor/"+string(base64_encode(argument0))+".puz";
  if (file_exists(path)){
    var buff = buffer_load(path);
    if (buffer_read(buff, buffer_u8) != 143){
      buffer_delete(buff);
      console_print("Error file not found: "+path, c_red);
      return false;
    }
    obj_editor.world_name =  base64_decode(buffer_read(buff, buffer_string));
    obj_editor.world_width = buffer_read(buff, buffer_u32);
    obj_editor.world_height = buffer_read(buff, buffer_u32);
    obj_editor.world_players = buffer_read(buff, buffer_u8);
    ui_set_value(obj_editor.input_name, obj_editor.world_name);
    ui_set_value(obj_editor.input_width, obj_editor.world_width);
    ui_set_value(obj_editor.input_height, obj_editor.world_height);
    ui_set_value(obj_editor.input_players, obj_editor.world_players);
    
    var entlist = ds_list_create();
    var ent_number = buffer_read(buff, buffer_u32);
    for (i=0; i<ent_number; i+=1)
    {
      var xx = buffer_read(buff, buffer_u16);
      var yy = buffer_read(buff, buffer_u16);
      var inst = instance_create(xx,yy,obj_editor_ent);
      inst.gp_obj_index = buffer_read(buff, buffer_u16);
      ds_list_add(entlist, inst);
    };
    
    var index = buffer_read(buff, buffer_u32);
    while (index < ent_number){
      var inst = entlist[| index];
      var attr = buffer_read(buff, buffer_string);
      var src_attr = gp_objects[? inst.gp_obj_index];
      var src_attr_list = src_attr[? "attr"];
      var src_attr_attr = src_attr_list[? attr];
      var val = buffer_read(buff,src_attr_attr[? "type"]);
      inst.overwrite_attr[? attr] = val;
      index = buffer_read(buff, buffer_u32);
    }
    
    ds_list_destroy(entlist);
    buffer_delete(buff);
  }
}
