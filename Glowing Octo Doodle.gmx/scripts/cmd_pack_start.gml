///cmd_pack_start(args);
if (room == rm_game){
  pack_start(argument0[1]);
  interface[? "menu"] = "0";
  interface[? "submenu"] = 0;
  ui_gamepad_position = obj_menu.btn_play;
  if (array_length_1d(argument0)> 2){
    current_pack_goto_level(real(argument0[2]));
  }
}
