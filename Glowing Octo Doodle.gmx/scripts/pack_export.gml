///pack_export()
//exports the pack with all maps into one file
if (room == rm_pack_editor){
  var name = ui_get_value(obj_pack_editor.txt_name);
  var description = ui_get_value(obj_pack_editor.txt_description);
  var players = ui_get_value(obj_pack_editor.sli_players);
  
  var path = "packs/"+string(base64_encode(name))+".epak";
  if (file_exists(path)){
    file_delete(path);
  }
  
  var buff = buffer_create(1, buffer_grow, 1);
  buffer_write(buff, buffer_u8, 1);
  buffer_write(buff, buffer_string, name);
  buffer_write(buff, buffer_u8, 2);
  buffer_write(buff, buffer_string, description);
  buffer_write(buff, buffer_u8, 3);
  buffer_write(buff, buffer_string, players);
  for (var i=0; i<ds_list_size(obj_pack_editor.maps); i+=1){
    var map = obj_pack_editor.maps[| i];
    buffer_write(buff, buffer_u8, 4);
    var mapbuff = buffer_load("maps/"+string(base64_encode(map))+".puz");
    buffer_write(buff, buffer_u32, buffer_get_size(mapbuff)) //the size of the map in bytes is written before the map data
    buffer_copy(mapbuff, 0, buffer_get_size(mapbuff), buff, buffer_tell(buff));
    buffer_delete(mapbuff);
  };
  buffer_save(buff, path);
}
