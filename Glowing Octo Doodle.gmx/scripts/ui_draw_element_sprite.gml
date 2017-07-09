///ui_draw_element_sprite(x1,y1,x2,y2,element);
var element = argument4;
var sprite = element[? "sprite"];
var w = sprite_get_width(sprite);
var h = sprite_get_height(sprite);
var s = min((argument2 - argument0) / w, (argument3 - argument1) / h);
var ox = ((argument2-argument0)-(s * w)) / 2 + sprite_get_xoffset(sprite);
var oy = ((argument3-argument1)-(s * h)) / 2 + sprite_get_yoffset(sprite);
draw_sprite_ext(sprite,element[? "image"], argument0 + ox, argument1 + oy, s, s, 0, c_white, 1);
