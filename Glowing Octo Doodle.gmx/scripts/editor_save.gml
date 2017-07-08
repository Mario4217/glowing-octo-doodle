///editor_save()
if (room == rm_editor){
  var name = base64_encode(obj_editor.world_name);
  if (name == ""){
    interface[? "editor_error"] = "{editor.error.noname}";
    return false;
  }
  
  var buff = buffer_create(1,buffer_grow,1);
  
  buffer_write(buff, buffer_u8,143); //143 is a random id I now set for maps!
  buffer_write(buff, buffer_string, name);
  buffer_write(buff, buffer_u32, obj_editor.world_width);
  buffer_write(buff, buffer_u32, obj_editor.world_height);
  buffer_write(buff, buffer_u8, obj_editor.world_players);
  
  buffer_write(buff, buffer_u32, instance_number(obj_editor_ent));
  for(var i=0; i<instance_number(obj_editor_ent); i++){
    var inst = instance_find(obj_editor_ent,i);
    inst.index = i;
    buffer_write(buff, buffer_u16,inst.x);
    buffer_write(buff, buffer_u16,inst.y);
    buffer_write(buff, buffer_u16,inst.gp_obj_index);
  }
  
  buffer_save(buff,"editor/"+string(name)+".puz");
  buffer_delete(buff);  
}
