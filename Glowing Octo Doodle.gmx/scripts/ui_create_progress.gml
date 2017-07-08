///ui_create_progress(u1,v1,u2,v2,text)
var map = ui_create_container(argument0,argument1,argument2,argument3);
map[? "type"] = "progress";
map[? "text"] = argument4;
map[? "progress"] = 0;
map[? "gp_jump"] = true;
return map;
