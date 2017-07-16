///nw_make_player(socket);
var map = ds_map_create();
map[? "name"] = "";
map[? "socket"] = argument0;
map[? "red"] = 0;
map[? "green"] = 0;
map[? "blue"] = 0;
map[? "pawn"] = instance_create(0,0,obj_player_pawn);

return map;
