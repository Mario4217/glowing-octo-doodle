///ui_create_button(u1,v1,u2,v2,text,command)
var map = ui_create_container(argument0,argument1,argument2,argument3);
map[? "text"] = argument4;
map[? "type"] = "button";
map[? "onclick"] = argument5;
map[? "pressed"] = false;
return map;
