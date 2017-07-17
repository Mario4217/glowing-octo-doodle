///cmd_current_pack(args)
if (current_pack == -1){
  console_print("You are not currently playing a level pack!")
}else{
  console_print("You are playing: "+string(current_pack[? "name"]));
  console_print("This pack is for "+string(current_pack[? "players"])+" players");
}
