///ui_create_spinner(u1,v1,u2,v2,min,max,step)
var map = ui_create_container(argument0,argument1,argument2,argument3);
map[? "type"] = "spinner";
map[? "value"] = 0;
map[? "min"] = argument4;
map[? "max"] = argument5;
map[? "step"] = argument6;
return map;
