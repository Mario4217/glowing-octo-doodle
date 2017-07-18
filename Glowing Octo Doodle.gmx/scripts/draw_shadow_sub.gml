///draw_shadow_sub()
if (init){
  var xx = -view_xview[0];
  var yy = -view_yview[0];
  switch (src_map[? "id"]){
    case 3:
      draw_set_blend_mode(bm_subtract)
      draw_rectangle(bbox_left+xx, bbox_top+yy, bbox_right+xx, bbox_bottom+yy,false);
      draw_set_blend_mode(bm_normal)
    break;
  }
}
