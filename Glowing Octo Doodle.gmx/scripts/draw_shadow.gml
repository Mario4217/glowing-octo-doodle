///draw_shadow()
if (init){
  var xx = -view_xview[0];
  var yy = -view_yview[0];
  switch (src_map[? "id"]){
    case 3:
      shadow_line_sun(bbox_left+xx, bbox_top+yy, bbox_right+xx, bbox_top+yy, sun_direction, sun_length*64);
      shadow_line_sun(bbox_left+xx, bbox_bottom+yy, bbox_right+xx, bbox_bottom+yy, sun_direction, sun_length*64);
      shadow_line_sun(bbox_right+xx, bbox_top+yy, bbox_right+xx, bbox_bottom+yy, sun_direction, sun_length*64);
      shadow_line_sun(bbox_left+xx, bbox_top+yy, bbox_left+xx, bbox_bottom+yy, sun_direction, sun_length*64);
    break;
    case 9:
      /*
      var l = attr[? ATTRIBUTE.left] / 512;
      var t = attr[? ATTRIBUTE.top] / 512;
      var r = (attr[? ATTRIBUTE.left] + attr[? ATTRIBUTE.width]) / 512;
      var b = (attr[? ATTRIBUTE.top] + attr[? ATTRIBUTE.height]) / 512;
      var len = attr[? ATTRIBUTE.height] * sun_length;
      draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(spr_tiles, attr[? ATTRIBUTE.skin]));
      draw_vertex_texture(bbox_left+xx, bbox_bottom+yy, l, b);
      draw_vertex_texture(bbox_right+xx, bbox_bottom+yy, r, b);
      draw_vertex_texture(bbox_left+xx+lengthdir_x(sun_direction, len), bbox_bottom+yy+lengthdir_y(sun_direction, len), l, t);
      draw_vertex_texture(bbox_right+xx+lengthdir_x(sun_direction, len), bbox_bottom+yy+lengthdir_y(sun_direction, len), r, t);
      draw_primitive_end()
      */
    break;
  }
}
