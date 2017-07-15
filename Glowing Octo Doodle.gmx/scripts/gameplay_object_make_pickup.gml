///gameplay_object_make_pickup(object id, weight)
var map = gp_objects[? argument0];
if (map != undefined){
  ds_list_add(map[? "tags"], "pickup");
  map[? "weight"] = argument1;
}
