///cmd_editor(args)
if (!is_network){
  if (array_length_1d(argument0) == 1){
    room = rm_editor;
  }else{
    room = rm_editor;
    var name = argument0[1];
    global.toLoad = name;
  }
}else{
  console_print("Can't acces the editor while playing in multiplayer!",c_red);
}
