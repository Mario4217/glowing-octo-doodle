///refresh_editor_level()
with (obj_menu){
  var parent = menu_editor_level;
  ds_list_clear(parent[? "children"]);
  filename = file_find_first("editor\*.puz", 0);
  var i = 0;
  while(filename != ""){
    var b = ui_split(filename,".");
    var name = base64_decode(b[0]);
    ui_add_child(parent, ui_create_button(0,i*0.1,1,i*0.1+0.1,name,"editor "+string(name)));
    filename = file_find_next();
    i++
  }
  file_find_close();
}
