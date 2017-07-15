///cmd_teleport(args)
if (instance_exists(obj_player_controller)){
  obj_player_controller.player_pawn.x = real(argument0[1]);
  obj_player_controller.player_pawn.y = real(argument0[2]);
}
