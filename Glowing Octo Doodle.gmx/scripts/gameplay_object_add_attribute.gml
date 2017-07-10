///gameplay_object_add_attribute(object id, attribute, name,  default, type, min, max)
var obj = gp_objects[? argument0];
if (obj != undefined){
  var map = ds_map_create();
  map[? "name"] = argument2;
  map[? "default"] = argument3;
  map[? "type"] = argument4;
  map[? "min"] = argument5;
  map[? "max"] = argument6;
  ds_map_add_map(obj[? "attr"], argument1, map);
}
