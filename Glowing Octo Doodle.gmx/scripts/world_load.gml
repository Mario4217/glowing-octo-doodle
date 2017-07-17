///world_load(puzzle name)
var path = "maps/"+string(base64_encode(argument0))+".puz";
global.current_map_path = path;
if (file_exists(path)){
  var buff = buffer_load(path);
  world_from_buffer(buff);
  buffer_delete(buff);
}
