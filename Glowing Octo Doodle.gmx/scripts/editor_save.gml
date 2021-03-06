///editor_save()
if (room == rm_editor){
  var name = base64_encode(obj_editor.world_name);
  if (name == ""){
    interface[? "editor_error"] = "{editor.error.noname}";
    return false;
  }
  var id_type = buffer_u16; //type that is used to write ids
  
  var buff = buffer_create(1,buffer_grow,1);
  
  buffer_write(buff, buffer_u8,143); //143 is a random id I now set for maps!
  buffer_write(buff, buffer_u8,1); //loader version!
  buffer_write(buff, buffer_u8,id_type); //id byte size
  buffer_write(buff, buffer_string, name);
  buffer_write(buff, buffer_u32, obj_editor.world_width);
  buffer_write(buff, buffer_u32, obj_editor.world_height);
  buffer_write(buff, buffer_u8, obj_editor.world_players);
  
  //basic entities
  buffer_write(buff, buffer_u32, instance_number(obj_editor_ent));
  for(var i=0; i<instance_number(obj_editor_ent); i++){
    var inst = instance_find(obj_editor_ent,i);
    inst.index = i;
    buffer_write(buff, buffer_u16,inst.x);
    buffer_write(buff, buffer_u16,inst.y);
    buffer_write(buff, buffer_u16,inst.gp_obj_index);
  }
  
  //special entity attributes
  for(var i=0; i<instance_number(obj_editor_ent); i++){
    var inst = instance_find(obj_editor_ent,i);
    var key = ds_map_find_first(obj_editor_ent);
    var src_map = gp_objects[? inst.gp_obj_index];
    src_map = src_map[? "attr"];
    var key = ds_map_find_first(inst.attr)
    for (var j=0; j<ds_map_size(inst.attr); j++)
    {
      var src_attr = src_map[? key];
      if (src_attr != undefined){
        var type = src_attr[? "type"]
        buffer_write(buff, id_type, i);
        buffer_write(buff, buffer_u16, key);
        buffer_write(buff, buffer_u8, type);
        switch (type){
          case ATTR_TYPE.u8:
          case ATTR_TYPE.slider_u8:
            buffer_write(buff, buffer_u8, inst.attr[? key]);
          break;
          case ATTR_TYPE.u16:
          case ATTR_TYPE.slider_u16:
            buffer_write(buff, buffer_u16, inst.attr[? key]);          
          break;
          case ATTR_TYPE.u32:
            buffer_write(buff, buffer_u32, inst.attr[? key]);
          break;
          case ATTR_TYPE.u64:
            buffer_write(buff, buffer_u64, inst.attr[? key]);
          break;
          case ATTR_TYPE.f32:
            buffer_write(buff, buffer_f32, inst.attr[? key]);
          break;
          case ATTR_TYPE.f64:
            buffer_write(buff, buffer_f64, inst.attr[? key]);
          break;
          case ATTR_TYPE.text:
            buffer_write(buff, buffer_string, inst.attr[? key]);
          break;
          case ATTR_TYPE.bool:
            buffer_write(buff, buffer_bool, inst.attr[? key]);
          break;
          case ATTR_TYPE.color:
            buffer_write(buff, buffer_u8, color_get_red(inst.attr[? key]));
            buffer_write(buff, buffer_u8, color_get_green(inst.attr[? key]));
            buffer_write(buff, buffer_u8, color_get_blue(inst.attr[? key]));
          break;
          case ATTR_TYPE.inst:
            buffer_write(buff, buffer_u16, color_get_red(inst.attr[? key]));
          break;
        }
      }
      key = ds_map_find_next(inst.attr, key);
    };
  }
  buffer_write(buff, id_type, i+1);
  
  //events
  for(var i=0; i<instance_number(obj_editor_ent); i++){
    var inst = instance_find(obj_editor_ent,i);
    for (j=0; j<ds_list_size(inst.outputs); j++)
    {
      var map = inst.outputs[| j];
      buffer_write(buff, id_type, i);
      buffer_write(buff, buffer_u16, map[? "event"]);
      buffer_write(buff, id_type, map[? "target"].index);
      buffer_write(buff, buffer_u16, map[? "action"]);
    };
  }
  
  buffer_write(buff, id_type, i+1);
  
  grid_to_buffer(buff, obj_editor.grid_floor);
  
  editor_show_info("{editor.saved}",3);
  
  buffer_resize(buff, buffer_tell(buff)+1);
  
  buffer_save(buff,"maps/"+string(name)+".puz");
  //Can't use buffer_save_async, because we are not developing for console! Thanks yoyogames missing information in the docs
  //obj_editor.saveid = buffer_save_async(buff,"maps/"+string(name)+".puz", 0, buffer_get_size(buff));
  buffer_delete(buff);
}
