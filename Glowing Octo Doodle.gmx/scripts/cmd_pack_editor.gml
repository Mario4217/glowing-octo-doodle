///cmd_pack_editor(args)
if (!is_network){
  if (array_length_1d(argument0) == 1){
    room = rm_pack_editor;
  }else{
    room = rm_pack_editor;
    var name = argument0[1];
    global.toLoad = name;
  }
}else{
  console_print("Can't acces the editor while playing in multiplayer!",c_red);
}
