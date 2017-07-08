///cmd_room(args)
if (room_exists(argument0[1])){
  room_goto(argument0[1]);
  console_print("goto "+room_get_name(argument0[1]));
}else{
  console_print("The room does not exists!",c_red);
}
