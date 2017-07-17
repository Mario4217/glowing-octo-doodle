///nw_broadcast(buffer, not him)
var him = -1;
if (argument_count > 1){
  him = argument[1];
}

if (nw_type == "TCP"){
  if (is_server){
    var key = ds_map_find_first(nw_players);
    for (var i=0; i<ds_map_size(nw_players); i+=1){
      var player = nw_players[? key];
      if (player != him && player[? "connected"]){
        network_send_packet(player[? "socket"], argument[0], buffer_get_size(argument[0]));
      }
      key = ds_map_find_next(nw_players, key);
    };
  }else{
    network_send_packet(nw_socket, argument[0], buffer_get_size(argument[0]));
  }
}
