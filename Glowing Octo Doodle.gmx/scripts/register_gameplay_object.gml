///register_gameplay_object(id,name,object);
var map = ds_map_create();
map[? "id"] = argument0;
map[? "name"] = argument1;
map[? "object"] = argument2;
map[? "sprite"] = object_get_sprite(argument2);
map[? "yanchor"] = YANCHOR.normal;
ds_map_add_list(map, "tags",ds_list_create());
ds_map_add_map(map, "attr",ds_map_create());
ds_map_add_list(map, "outputs", ds_list_create());
ds_map_add_list(map, "inputs", ds_list_create());
gp_objects[? argument0] = map;
