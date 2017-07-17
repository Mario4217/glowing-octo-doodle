///world_floor_update_chunk(x, y)
if (argument0 >= 0 && argument1 >= 0 && argument0 < obj_floor.width / obj_floor.chunk_size && argument1 < obj_floor.height / obj_floor.chunk_size){
  var surf = obj_floor.chunk_shadow[argument0, argument1];
  if (!surface_exists(surf)){
    surf = surface_create(32*obj_floor.chunk_size, 32*obj_floor.chunk_size);
    obj_floor.chunk_shadow[argument0, argument1] = surf;
  }else{
    surface_resize(surf, 32*obj_floor.chunk_size, 32*obj_floor.chunk_size);
  }
  
  var lx = view_xview[0];
  var ly = view_yview[0];
  view_xview[0] = argument0*32*obj_floor.chunk_size;
  view_yview[0] = argument1*32*obj_floor.chunk_size;
  
  draw_set_color(c_black);
  
  surface_set_target(surf)
  draw_clear_alpha(0, 0);
  with (obj_parent_gameplay){
    draw_shadow();
  }
  with (obj_editor_ent){
    draw_shadow();
  }
  surface_reset_target();
  
  view_xview[0] = lx;
  view_yview[0] = ly;
}
