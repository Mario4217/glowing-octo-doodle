///gameplay_object_add_output(object id, output)
var map = gp_objects[? argument0];
if (map != undefined){
  ds_list_add(map[? "outputs"], argument1);
}
