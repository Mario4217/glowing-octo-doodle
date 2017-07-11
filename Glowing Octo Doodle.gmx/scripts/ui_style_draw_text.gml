///ui_style_draw_text(x1,y1,x2,y2,element,state,text);

var text_alpha = ui_style_get(argument4,"text-alpha",argument5,ui_current_class);
var text_color = ui_style_get(argument4,"text-color",argument5,ui_current_class);
if (ui_style_get(argument4,"animation","",ui_current_class) && (argument5 == "hover" || argument5 == "")){
  var tah = ui_style_get(argument4,"text-alpha","hover",ui_current_class); //text alpha hover
  var tch = ui_style_get(argument4,"text-color","hover",ui_current_class); //text color hover
  var tad = ui_style_get(argument4,"text-alpha","",ui_current_class); //text alpha default
  var tcd = ui_style_get(argument4,"text-color","",ui_current_class); //text color default
  text_color = merge_colour(tcd, tch, ui_current_hover);
  text_alpha = lerp(tad, tah, ui_current_hover);
}

var x1 = argument0 + ui_style_get(argument4,"text-padding",argument5,ui_current_class);
var y1 = argument1 + ui_style_get(argument4,"text-padding",argument5,ui_current_class);;
var x2 = argument2 - ui_style_get(argument4,"text-padding",argument5,ui_current_class);;
var y2 = argument3 - ui_style_get(argument4,"text-padding",argument5,ui_current_class);;

var halign = ui_style_get(argument4,"text-halign",argument5,ui_current_class);
var ox = 0;
if (halign == fa_center){
  ox = (x2-x1)/2
}else if(halign == fa_right){
  ox = (x2-x1)
}
var valign = ui_style_get(argument4,"text-valign",argument5,ui_current_class);
var oy = 0;
if (valign == fa_middle){
  oy = (y2-y1)/2
}else if(valign == fa_bottom){
  oy = (y2-y1)
}

var scale = min(view_wport[0]/1960,view_hport[0]/1080);
draw_set_alpha(text_alpha);
draw_set_halign(halign);
draw_set_valign(valign);
draw_set_color(text_color);
draw_text_ext_transformed(x1+ox,y1+oy,argument6,string_height("|"),(x2-x1)/scale,scale,scale,0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);

