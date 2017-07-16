///nw_host(clients)
if (nw_type == "TCP"){
  nw_server = network_create_server(network_socket_tcp, nw_port, argument0);
  if (nw_server >= 0){
    nw_buffer = buffer_create(1, buffer_grow, 1);
    in_network = true;
    return true;
  }else{
    console_print("Failed to create server!")
    return false;
  }
}
