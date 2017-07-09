///cmd_editor_test()
if (room == rm_editor){
  editor_save();
  global.toLoad = obj_editor.world_name;
  room = rm_game;
}
