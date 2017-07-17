///nw_end()
if (is_server){
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
