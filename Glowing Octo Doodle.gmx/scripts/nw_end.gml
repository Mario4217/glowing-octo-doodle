///nw_end()
if (is_server){
  buffer_seek(nw_buffer, buffer_seek_start, 0);
  buffer_write(nw_buffer, buffer_u8, NW.server_close);
  nw_broadcast(nw_buffer);

  network_destroy(nw_server)
}else{
  network_destroy(nw_socket)
}
is_network = false;
is_server = true;
nw_is_connected = false;
buffer_delete(nw_buffer);
console_print("Quit network session");

ds_map_clear(nw_players);
nw_players[? 0] = profile_map;
