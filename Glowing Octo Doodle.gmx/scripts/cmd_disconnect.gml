///cmd_disconnect(args)
if (is_network){
  nw_end();
}else{
  console_print("You are not connected to something!");
}
