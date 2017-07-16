///pack_save()
if (room == rm_pack_editor){
  var name = ui_get_value(obj_pack_editor.txt_name);
  var description = ui_get_value(obj_pack_editor.txt_description);
  var players = ui_get_value(obj_pack_editor.sli_players);
  
  var path = "packs/"+string(base64_encode(name))+".pak";
  if (file_exists(path)){
    file_delete(path);
  }
  
  ini_open(path);
  ini_write_string("info","name",name);
  ini_write_string("info","description",description);
  ini_write_real("info","players",players);
  for (var i=0; i<ds_list_size(obj_pack_editor.maps); i+=1){
    var map = obj_pack_editor.maps[| i];
    ini_write_string("maps",string(i),map[? "name"]);
  };
  
  ini_close();
}
