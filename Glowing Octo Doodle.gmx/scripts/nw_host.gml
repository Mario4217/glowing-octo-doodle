///nw_host(clients)
if (nw_type == "TCP"){
  nw_server = network_create_server(network_socket_tcp, nw_port, argument0);
  if (nw_server >= 0){
    nw_buffer = buffer_create(256, buffer_grow, 1);
    is_network = true;
    is_server = true;
    nw_is_connected = true;
    console_print("Now hosting a server");
    return true;
  }else{
    console_print("Failed to create server!")
    return false;
  }
}
