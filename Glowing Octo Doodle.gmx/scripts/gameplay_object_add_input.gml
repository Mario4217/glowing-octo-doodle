///gameplay_object_add_input(object id, input)
var map = gp_objects[? argument0];
if (map != undefined){
  ds_list_add(map[? "inputs"], argument1);
}
