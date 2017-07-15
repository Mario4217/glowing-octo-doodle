///cmd_editor_exit(args)
if (room == rm_editor || room == rm_pack_editor){
  room = rm_game;
  interface[? "menu"] = "1";
}
