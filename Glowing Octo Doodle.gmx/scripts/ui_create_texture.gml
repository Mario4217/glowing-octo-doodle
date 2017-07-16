///ui_create_texture(u1,v1,u2,v2,texture,width,height)
var map = ui_create_container(argument0,argument1,argument2,argument3);
map[? "type"] = "texture";
map[? "texture"] = argument4;
map[? "blend"] = c_white;
map[? "tex_top"] = 0;
map[? "tex_right"] = 0;
map[? "tex_width"] = argument5;
map[? "tex_height"] = argument6;
map[? "width"] = argument5;
map[? "height"] = argument6;
return map;
