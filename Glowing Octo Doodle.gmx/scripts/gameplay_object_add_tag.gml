///gameplay_object_add_tag(id, tag);
var map = gp_objects[? argument0];
if (map != undefined){
  ds_list_add(map[? "tags"], argument1);
}
