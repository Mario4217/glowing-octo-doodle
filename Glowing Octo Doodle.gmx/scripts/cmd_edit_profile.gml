///cmd_edit_profile(args)
var key = argument0[1];
var val = argument0[2];

if (is_real(profile_map[? key])){
  profile_map[? key] = real(val);
}else{
  profile_map[? key] = val;
}

profile_map[? "color"] = make_color_rgb(profile_map[? "red"], profile_map[? "green"], profile_map[? "blue"]);

if (room == rm_game){
  obj_player_controller.player_pawn.secondary_color = make_color_rgb(profile_map[? "red"], profile_map[? "green"], profile_map[? "blue"]);
}

//maybe this will be moved because it can happen stepwise
ini_open("profile.ini");
ini_write_real("color","red",profile_map[? "red"]);
ini_write_real("color","green",profile_map[? "green"]);
ini_write_real("color","blue",profile_map[? "blue"]);
ini_write_string("player","name",profile_map[? "name"]);
ini_close();

if (is_network){
  nw_send_profile();
}
