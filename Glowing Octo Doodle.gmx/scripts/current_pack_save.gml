///current_pack_save()
if (current_pack != -1){
  var buff = buffer_create(1, buffer_grow, 1);
  
  buffer_write(buff, buffer_string, current_pack[? "name"]);
  buffer_write(buff, buffer_u16, current_pack[? "current_map_index"]);
  buffer_write(buff, buffer_u8, current_pack[? "players"]);
  
  buffer_save(buff, "saves/"+string(base64_encode(current_pack[? "name"]))+".sav");
  buffer_delete(buff);
  
  refresh_saves();
}
