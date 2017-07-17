///cmd_noclip(args)
if (allow_cheats){
  cheat_noclip = 1-cheat_noclip;
  if (array_length_1d(argument0)>1){
    if (real(argument0[1]) == 0 || real(argument0[1]) == 1){
      cheat_noclip = real(argument0[1]);
    }
  }
}else{
  console_print("Cheats are not allowed!");
}
