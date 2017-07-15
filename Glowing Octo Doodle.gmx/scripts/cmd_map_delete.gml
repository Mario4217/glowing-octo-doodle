///cmd_map_delete(args)
var mapname = argument0[1];
var filename = "editor/"+base64_encode(mapname)+".puz";
if (file_exists(filename)){
  file_delete(filename);
  refresh_editor_level();
}
