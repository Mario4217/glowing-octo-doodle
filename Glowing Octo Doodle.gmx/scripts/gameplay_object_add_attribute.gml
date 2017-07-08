///gameplay_object_add_attribute(object id, attribute, default, type, min, max)
var obj = gp_objects[? argument0];
if (obj != undefined){
  var map = ds_map_create();
  map[? "default"] = argument2;
  map[? "type"] = argument3;
  map[? "min"] = argument4;
  map[? "max"] = argument5;
  ds_map_add_map(obj[? "attr"], argument1, map);
}
