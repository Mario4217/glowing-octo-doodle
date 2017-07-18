///ui_draw_element_texture(x1,y1,x2,y2,element);
var element = argument4;
var texture = element[? "texture"];

var w = element[? "width"];
var h = element[? "height"];

var top = element[? "tex_top"] / h;
var left = element[? "tex_left"] / w;
var bottom = (element[? "tex_top"] + element[? "tex_height"]) / h;
var right = (element[? "tex_left"] + element[? "tex_width"]) / w;

var part_w = (right - left) * w;
var part_h = (bottom - top) * h;

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var ui_w = x2 - x1;
var ui_h = y2 - y1;

var scale = min(ui_w/part_w, ui_h/part_h);
var ratio = ui_w / ui_h;

var xo = (ui_w - part_w * scale) / 2;

draw_set_color(element[? "blend"]);
draw_primitive_begin_texture(pr_trianglestrip, texture);
draw_vertex_texture(argument0+xo, argument1, left, top);
draw_vertex_texture(argument2-xo, argument1, right, top);
draw_vertex_texture(argument0+xo, argument3, left, bottom);
draw_vertex_texture(argument2-xo, argument3, right, bottom);
draw_primitive_end();
