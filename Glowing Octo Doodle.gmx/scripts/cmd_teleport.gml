///cmd_teleport(args)
if (instance_exists(obj_player_controller)){
  //x
  if (string_char_at(argument0[1], 1) == "+" || string_char_at(argument0[1], 1) == "-"){ //if first char is "+" or "-", teleport relative
    obj_player_controller.player_pawn.x += real(argument0[1]);
  }else{
    obj_player_controller.player_pawn.x = real(argument0[1]);
  }
  //y
  if (string_char_at(argument0[2], 1) == "+" || string_char_at(argument0[2], 1) == "-"){ //if first char is "+" or "-", teleport relative
    obj_player_controller.player_pawn.y += real(argument0[2]);
  }else{
    obj_player_controller.player_pawn.y = real(argument0[2]);
  }
  console_print("Teleported to: "+string(obj_player_controller.player_pawn.x)+" ,"+string(obj_player_controller.player_pawn.y));
}
