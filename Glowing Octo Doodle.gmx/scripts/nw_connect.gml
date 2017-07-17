///nw_connect(ip)
if (nw_type == "TCP" && is_network == false){
  is_server = false;
  is_network = true;
  nw_is_connected = false;
  nw_socket = network_create_socket(network_socket_tcp);
  network_connect(nw_socket, argument0, nw_port);
}
