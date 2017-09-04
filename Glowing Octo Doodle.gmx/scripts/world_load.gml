///world_load(puzzle name)
var path = "maps/"+string(base64_encode(argument0))+".puz";
global.current_map_path = path;

if (!file_exists(path)){
  var path = "maps/pack/"+string(base64_encode(argument0))+".puz";
  if (!file_exists(path)){
    console_print("The map: "+string(argument0)+" does not exist!", c_red);
    return false;
  }
}

if (file_exists(path)){
  var buff = buffer_load(path);
  
  //when in main menu world
  if (path == "maps/dGl0bGU=.puz"){
    interface[? "menu"] = "1";
    ui_gamepad_position = obj_menu.btn_play;
  }
  
  if (is_network){
    var send_buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(send_buffer, buffer_seek_start, 0);
    buffer_write(send_buffer, buffer_u8, NW.map_data);
    buffer_copy(buff, 0, buffer_get_size(buff), send_buffer, 1);    
    nw_broadcast(send_buffer);
    buffer_delete(send_buffer);
  }
  
  world_from_buffer(buff);
  buffer_delete(buff);
}
