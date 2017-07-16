///ui_draw_element_texture(x1,y1,x2,y2,element);
var element = argument4;
var texture = element[? "texture"];

var w = element[? "width"];
var h = element[? "height"];

var top = element[? "tex_top"] / h;
var left = element[? "tex_left"] / w;
var bottom = (element[? "tex_top"] + element[? "tex_height"]) / h;
var right = (element[? "tex_left"] + element[? "tex_width"]) / w;

draw_set_color(element[? "blend"]);
draw_primitive_begin_texture(pr_trianglestrip, texture);
draw_vertex_texture(argument0, argument1, left, top);
draw_vertex_texture(argument2, argument1, right, top);
draw_vertex_texture(argument0, argument3, left, bottom);
draw_vertex_texture(argument2, argument3, right, bottom);
draw_primitive_end();
