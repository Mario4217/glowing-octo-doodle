///nw_send(player, buffer);
if (nw_type == "TCP"){
  network_send_packet(argument0[? "socket"], argument1, buffer_get_size(argument1));
}
