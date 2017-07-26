///ui_style_draw_rectangle(x1,y1,x2,y2,element,state);

var bg_color = real(ui_style_get(argument4,"background-color",argument5,ui_current_class));
var bg_alpha = real(ui_style_get(argument4,"background-alpha",argument5,ui_current_class));
var bo_color = real(ui_style_get(argument4,"border-color",argument5,ui_current_class));
var bo_alpha = real(ui_style_get(argument4,"border-alpha",argument5,ui_current_class));
var bo_radius = real(ui_style_get(argument4,"border-radius",argument5,ui_current_class));
if (ui_current_hover > 0 && ui_current_hover < 1)
if (ui_style_get(argument4,"animation","",ui_current_class) && (argument5 == "hover" || argument5 == "")){
  var bg_color_h = ui_style_get(argument4,"background-color","hover",ui_current_class);
  var bg_alpha_h = ui_style_get(argument4,"background-alpha","hover",ui_current_class);
  var bo_color_h = ui_style_get(argument4,"border-color","hover",ui_current_class);
  var bo_alpha_h = ui_style_get(argument4,"border-alpha","hover",ui_current_class);
  var bo_radius_h = real(ui_style_get(argument4,"border-radius","hover",ui_current_class));
  var bg_color_d = ui_style_get(argument4,"background-color","",ui_current_class);
  var bg_alpha_d = real(ui_style_get(argument4,"background-alpha","",ui_current_class));
  var bo_color_d = ui_style_get(argument4,"border-color","",ui_current_class);
  var bo_alpha_d = real(ui_style_get(argument4,"border-alpha","",ui_current_class));
  var bo_radius_d = real(ui_style_get(argument4,"border-radius","",ui_current_class));
  bg_color = merge_color(bg_color_d,bg_color_h,ui_current_hover);
  bo_color = merge_color(bo_color_d,bo_color_h,ui_current_hover);
  bg_alpha = lerp(bg_alpha_d, bg_alpha_h,ui_current_hover);
  bo_alpha = lerp(bo_alpha_d, bo_alpha_h,ui_current_hover);
  bo_radius = lerp(bo_radius_d, bo_radius_h,ui_current_hover);
}

var x1 = floor(argument0);
var y1 = floor(argument1);
var x2 = floor(argument2);
var y2 = floor(argument3);
var class = argument4;
draw_set_alpha(bg_alpha);
draw_set_color(bg_color);
draw_roundrect_ext(x1,y1,x2,y2,bo_radius,bo_radius,false);
draw_set_alpha(bo_alpha);
draw_set_color(bo_color);
draw_roundrect_ext(x1,y1,x2,y2,bo_radius,bo_radius,true)
draw_set_alpha(1);
