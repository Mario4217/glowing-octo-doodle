///world_floor_update_chunk(x, y)
if (argument0 >= 0 && argument1 >= 0 && argument0 < (obj_floor.width / obj_floor.chunk_size) && argument1 < (obj_floor.height / obj_floor.chunk_size)){
  var surf = obj_floor.chunk_floor[argument0, argument1];
  if (!surface_exists(surf)){
    surf = surface_create(32*obj_floor.chunk_size, 32*obj_floor.chunk_size);
    obj_floor.chunk_floor[argument0, argument1] = surf;
  }else{
    surface_resize(surf, 32*obj_floor.chunk_size, 32*obj_floor.chunk_size);
  }
  draw_set_color(c_white);
  surface_set_target(surf)
  draw_clear_alpha(0, 0);
  for (var i=0; i<obj_floor.chunk_size; i+=1){
    for (var j=0; j<obj_floor.chunk_size; j+=1){
      var index = obj_floor.grid[# i+argument0*obj_floor.chunk_size, j+argument1*obj_floor.chunk_size];
      var tex = floorlist[index, 0];
      var xx = i*32;
      var yy = j*32;
      var w = floorlist[index, 1];
      var h = floorlist[index, 2];
      draw_primitive_begin_texture(pr_trianglestrip, tex);
      draw_vertex_texture(xx, yy, (xx % w)/w, (yy % h)/h);
      draw_vertex_texture(xx+32, yy, ((xx % w)+32)/w, (yy % h)/h);
      draw_vertex_texture(xx, yy+32, (xx % w)/w, ((yy % h)+32)/h);
      draw_vertex_texture(xx+32, yy+32, ((xx % w) + 32)/w, ((yy % h)+32)/h);
      draw_primitive_end();
    };  
  };
  /* //If tiles will be drawn onto the floor
  var xo = argument0*32*obj_floor.chunk_size;
  var yo = argument1*32*obj_floor.chunk_size;
  for (var i=0; i<instance_number(obj_gp_tile); i+=1){
    var inst = instance_find(obj_gp_tile, i);
    if (inst.init){
      draw_sprite_part(spr_tiles, inst.attr[? ATTRIBUTE.skin], inst.attr[? ATTRIBUTE.left], inst.attr[? ATTRIBUTE.top], inst.attr[? ATTRIBUTE.width], inst.attr[? ATTRIBUTE.height], inst.x-xo, inst.y-yo);
    }
  };
  */
  
  surface_reset_target();
}
