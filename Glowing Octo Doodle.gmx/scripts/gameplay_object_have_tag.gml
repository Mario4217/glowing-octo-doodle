///gameplay_object_have_tag(id, tag)
var ind = argument0;
var map = gp_objects[? ind];
if (map != undefined){
  return (ds_list_find_index(map[? "tags"], argument1) != -1);
}
