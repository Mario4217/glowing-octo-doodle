///ui_create_container(u1,v1,u2,v2)
var map = ds_map_create();
map[? "type"] = "container"
ds_map_add_list(map,"children",ds_list_create());
map[? "u1"] = argument0;
map[? "u2"] = argument2;
map[? "v1"] = argument1;
map[? "v2"] = argument3;
map[? "parent"] = -1;
map[? "visible"] = true;
map[? "class"] = "";
map[? "hoverness"] = 0;
return map;
