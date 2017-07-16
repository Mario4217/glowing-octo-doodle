///nw_end()
if (is_server){
  network_destroy(nw_server)
}else{
  network_destroy(nw_socket)
}
in_network = false;
is_server = true;
buffer_delete(nw_buffer);
console_print("Quit network session")
