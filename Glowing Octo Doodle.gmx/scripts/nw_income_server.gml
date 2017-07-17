///nw_income_server(buffer, player)
var player = argument1;

switch (buffer_read(argument0, buffer_u8)){
  case NW.server_welcome:
      //say hello to our nice client
      buffer_seek(nw_buffer, buffer_seek_start, 0);
      buffer_write(nw_buffer, buffer_u8, NW.server_welcome);
      buffer_write(nw_buffer, buffer_string, GM_version);
      buffer_write(nw_buffer, buffer_u8, player[? "id"]);
      nw_send(player, nw_buffer);
      
      var key = ds_map_find_first(nw_players); //sending the new one, who there is already
      for (i=0; i<ds_map_size(nw_players); i+=1){
        var pl = nw_players[? key];
        if (pl != player){ //he don't need to know about himself
          buffer_seek(nw_buffer, buffer_seek_start, 0);
          buffer_write(nw_buffer, buffer_u8, NW.client_connect);
          buffer_write(nw_buffer, buffer_u8, pl[? "id"]);
          buffer_write(nw_buffer, buffer_string, pl[? "name"]);
          buffer_write(nw_buffer, buffer_u8, pl[? "red"]);
          buffer_write(nw_buffer, buffer_u8, pl[? "green"]);
          buffer_write(nw_buffer, buffer_u8, pl[? "blue"]);
          nw_send(player, nw_buffer);
          key = ds_map_find_next(nw_players, key);
        }
      };
      
      var map_buffer = buffer_load(global.current_map_path);
      var send_buffer = buffer_create(256, buffer_grow, 1);
      buffer_seek(send_buffer, buffer_seek_start, 0);
      buffer_write(send_buffer, buffer_u8, NW.map_data);
      buffer_copy(map_buffer, 0, buffer_get_size(map_buffer), send_buffer, 1);    
      nw_send(player, send_buffer);
      buffer_delete(send_buffer);
      buffer_delete(map_buffer);
      
      player[? "connected"] = true;
  break;
  case NW.client_profile:
    player[? "red"] = buffer_read(argument0, buffer_u8);
    player[? "green"] = buffer_read(argument0, buffer_u8);
    player[? "blue"] = buffer_read(argument0, buffer_u8);
    player[? "name"] = buffer_read(argument0, buffer_string);
    
    player[? "pawn"].secondary_color = make_color_rgb(player[? "red"], player[? "green"], player[? "blue"]);
    
    buffer_seek(nw_buffer, buffer_seek_start, 0);
    buffer_write(nw_buffer, buffer_u8, async_load[? "id"]);
    buffer_write(nw_buffer, buffer_u8, player[? "red"]);
    buffer_write(nw_buffer, buffer_u8, player[? "green"]);
    buffer_write(nw_buffer, buffer_u8, player[? "blue"]);
    buffer_write(nw_buffer, buffer_string, player[? "name"]);
    nw_broadcast(nw_buffer);
  break;
  case NW.position:
    var xx = buffer_read(argument0, buffer_u16);
    var yy = buffer_read(argument0, buffer_u16);
    var pawn = player[? "pawn"];
    pawn.x = xx;
    pawn.y = yy;
    
    buffer_seek(nw_buffer, buffer_seek_start, 0);
    buffer_write(nw_buffer, buffer_u8, player[? "id"]);
    buffer_write(nw_buffer, buffer_u8, xx);
    buffer_write(nw_buffer, buffer_u8, yy);
    nw_broadcast(nw_buffer, player);
  break;
}
