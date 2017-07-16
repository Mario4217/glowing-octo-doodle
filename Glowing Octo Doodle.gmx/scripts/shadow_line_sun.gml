///shadow_line_sun(x1,y1,x2,y2,direction,length)
var ox = lengthdir_x(argument5,argument4);
var oy = lengthdir_y(argument5,argument4);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(argument0,argument1)
draw_vertex(argument2,argument3)
draw_vertex(argument0+ox,argument1+oy);
draw_vertex(argument2+ox,argument3+oy);
draw_primitive_end();
