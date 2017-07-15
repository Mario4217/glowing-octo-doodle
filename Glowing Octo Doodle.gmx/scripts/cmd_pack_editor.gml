///cmd_pack_editor(args)
if (array_length_1d(argument0) == 1){
  room = rm_pack_editor;
}else{
  room = rm_pack_editor;
  var name = argument0[1];
  global.toLoad = name;
}
