///nw_make_player(socket);
var map = ds_map_create();
map[? "name"] = "";
map[? "socket"] = argument0;
map[? "red"] = 255;
map[? "green"] = 255;
map[? "blue"] = 255;
map[? "pawn"] = instance_create(0,0,obj_player_pawn);
map[? "connected"] = false;
map[? "color"] = c_white;

return map;
