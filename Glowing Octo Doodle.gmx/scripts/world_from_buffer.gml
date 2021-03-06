///world_from_buffer(buffer)
buff = argument0;
if (buffer_read(buff, buffer_u8) != 143){
  console_print("Buffer is not a map!", c_red);
  return false;
}

if (room == rm_game){
  var world_object = obj_world; 
  with (obj_parent_gameplay){
    instance_destroy();
  }
  with (obj_player_pawn){
    pickup = -1;
  }
  ds_map_clear(obj_world.inst_by_index);
}else{
  var world_object = obj_editor;
}
ds_grid_clear(world_object.grid_floor, 0);
var ver = buffer_read(buff, buffer_u8); //load the save version
var id_type = buffer_read(buff, buffer_u8); //type that is used here to index objects

world_object.world_name = base64_decode(buffer_read(buff, buffer_string));
world_object.world_width = buffer_read(buff, buffer_u32);
world_object.world_height = buffer_read(buff, buffer_u32);
world_object.world_players = buffer_read(buff, buffer_u8);
world_resize(world_object.world_width, world_object.world_height);

if (room == rm_editor){
  ui_set_value(obj_editor.input_name, obj_editor.world_name);
  ui_set_value(obj_editor.input_width, obj_editor.world_width);
  ui_set_value(obj_editor.input_height, obj_editor.world_height);
  ui_set_value(obj_editor.input_players, obj_editor.world_players);
}

var entlist = ds_list_create();
var ent_number = buffer_read(buff, buffer_u32);
for (i=0; i<ent_number; i+=1){
  var xx = buffer_read(buff, buffer_u16);
  var yy = buffer_read(buff, buffer_u16);
  var gp_index = buffer_read(buff, buffer_u16);
  var gp = gp_objects[? gp_index];
  if (room == rm_game){
    if (gp != undefined){
      var inst = instance_create(xx,yy,gp[? "object"]);
      inst.gp_obj_index = gp_index;
    }
  }else{
    var inst = instance_create(xx,yy,obj_editor_ent);
    inst.gp_obj_index = gp_index;
  }
  ds_list_add(entlist, inst);
  if (room == rm_game){
    inst.index = i;
    obj_world.inst_by_index[? i] = inst;
  }
};

//special entity attributes
var index = buffer_read(buff, id_type);
while (index < ent_number){
  var inst = entlist[| index];
  var attr = buffer_read(buff, buffer_u16);
  var type = buffer_read(buff, buffer_u8);
  switch (type){
    case ATTR_TYPE.color:
      var val = make_color_rgb(buffer_read(buff, buffer_u8), buffer_read(buff, buffer_u8), buffer_read(buff, buffer_u8));
    break;
    case ATTR_TYPE.slider_u8:
      var val = buffer_read(buff, buffer_u8);
    break;
    case ATTR_TYPE.slider_u16:
      var val = buffer_read(buff, buffer_u16);
    break;
    default:
      var val = buffer_read(buff, type);
    break;
  }
  //var val = buffer_read(buff, type);
  inst.overwrite_attr[? attr] = val;
  index = buffer_read(buff, id_type);
}

//events
var index = buffer_read(buff, id_type);
while (index < ent_number){
  var inst = entlist[| index];
  var event = buffer_read(buff, buffer_u16);
  var target = buffer_read(buff, id_type);
  var action = buffer_read(buff, buffer_u16);
  var map = ds_map_create();
  map[? "event"] = event;
  map[? "source"] = inst;
  map[? "action"] = action;
  map[? "target"] = entlist[| target];
  ds_list_add(inst.outputs, map);
  if (room == rm_editor){
    ds_list_add(map[? "target"].inputs, map);
  }
  
  index = buffer_read(buff, id_type);
}

//floor grid
grid_from_buffer(buff, world_object.grid_floor);

//world_floor_update_all();
world_chunk_free_all();
obj_floor.alarm[0] = 2;

ds_list_destroy(entlist);
