///nw_send_profile()
buffer_seek(nw_buffer, buffer_seek_start, 0);
buffer_write(nw_buffer, buffer_u8, NW.client_profile);
if (is_server){
  buffer_write(nw_buffer, buffer_u8, 0);
}
buffer_write(nw_buffer, buffer_u8, profile_map[? "red"]);
buffer_write(nw_buffer, buffer_u8, profile_map[? "green"]);
buffer_write(nw_buffer, buffer_u8, profile_map[? "blue"]);
buffer_write(nw_buffer, buffer_string, profile_map[? "name"]);
network_send_packet(nw_socket, nw_buffer, buffer_get_size(nw_buffer));
nw_broadcast(nw_buffer);
