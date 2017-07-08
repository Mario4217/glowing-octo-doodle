///cmd_editor(args)
if (array_length_1d(argument0) == 1){
  room = rm_editor;
}else{
  room = rm_editor;
  var name = argument0[1];
  global.toLoad = name;
}
