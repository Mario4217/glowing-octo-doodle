///console_command_add(command,script,arguments,description,[usage]);
var map = ds_map_create();
map[? "script"] = argument[1];
map[? "arguments"] = argument[2];
map[? "description"] = argument[3];
map[? "name"] = argument[0];
map[? "usage"] = argument[0];
if (argument_count > 4){
  map[? "usage"] = argument[4];
}
ds_map_add_map(command_map, argument[0], map);
