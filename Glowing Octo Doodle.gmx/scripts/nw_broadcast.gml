///nw_broadcast(buffer)
if (nw_type == "TCP"){
  var key = ds_map_find_first(nw_players);
  for (var i=0; i<ds_map_size(nw_players); i+=1){
    var player = nw_players[? key];
    network_send_packet(player[? "socket"], argument0, buffer_get_size(argument0));
    key = ds_map_find_next(nw_players, key);
  };
}
