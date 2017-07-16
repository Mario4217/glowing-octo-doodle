///nw_connect(ip)
if (nw_type == "TCP" && is_network == false){
  is_server = false;
  in_network = true;
  nw_socket = network_create_socket(network_socket_tcp);
  network_connect(nw_socket, argument0, nw_port);
}
