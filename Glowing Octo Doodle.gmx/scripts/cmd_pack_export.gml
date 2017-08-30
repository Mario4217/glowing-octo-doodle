///cmd_pack_export()
if (room == rm_pack_editor){
  var path = pack_export();
  if (path){
    console_print("Exported pack to: "+string(path));
  }
}else{
  console_print("You need to be in the pack to editor!", c_orange);
}
