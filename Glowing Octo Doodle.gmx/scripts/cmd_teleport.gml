///cmd_teleport(args)
if (instance_exists(obj_player_controller)){
  obj_player_controller.pawn.x = real(argument0[1]);
  obj_player_controller.pawn.y = real(argument0[2]);
}