///shadow_line(x1,y1,x2,y2,srcX,srcY)

var d1 = point_direction(argument4,argument5,argument0,argument1);
var d2 = point_direction(argument4,argument5,argument2,argument3);

var ox1 = lengthdir_x(9999,d1)
var oy1 = lengthdir_y(9999,d1)

var ox2 = lengthdir_x(9999,d2)
var oy2 = lengthdir_y(9999,d2)

var lx1 = argument0;
var ly1 = argument1;
var lx2 = argument2;
var ly2 = argument3;

draw_primitive_begin(pr_trianglestrip);
draw_vertex(lx1,ly1);
draw_vertex(lx2,ly2);
draw_vertex(lx1+ox1,ly1+oy1);
draw_vertex(lx2+ox2,ly2+oy2);
draw_primitive_end();
