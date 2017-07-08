///ui_create_binding(u1,v1,u2,v2,group,index,value)
var map = ui_create_container(argument0,argument1,argument2,argument3);
map[? "type"] = "binding";
map[? "bind-group"] = argument4;
map[? "bind-index"] = argument5;
map[? "bind-val"] = argument6;
return map;
