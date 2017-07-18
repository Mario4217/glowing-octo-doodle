///refresh_editor_level()
with (obj_menu){
  var parent = menu_editor_level;
  ds_list_clear(parent[? "children"]);
  ds_list_clear(map_list);
  var btn_new = ui_add_child(parent, ui_create_button(0,0,1,0.1,"{menu.editor.new_map}","editor"));
  btn_maps[? "gp_port"] = btn_new;
  filename = file_find_first("maps\*.puz", 0);
  var i = 0;
  var v = 0.12;
  var h = 0.05;
  while(filename != ""){
    var map = ds_map_create();
    var b = ui_split(filename,".");
    var name = base64_decode(b[0]);
    map[? "name"] = name;
    map[? "filename"] = filename;
    ds_list_add_map(map_list, map);
    var btn = ui_add_child(parent, ui_create_button(0,v,1,v+h,name,'editor "'+string(name)+'"'));
    var del = ui_add_child(btn, ui_create_button(0.8, 0, 1, 1, "{menu.delete}", 'map_delete "'+string(name)+'"'));
    ui_set_class(del, "delete")
    del[? "gp_port"] = btn_maps;
    btn[? "gp_right"] = del;
    del[? "gp_left"] = btn;
    if (i == 0){
      del[? "gp_up"] = btn_new;
    }else{
      del[? "gp_up"] = last_del;
      last_del[? "gp_down"] = del;
    }
    last_del = del;
    filename = file_find_next();
    i++
    v+=h;
  }
  file_find_close();
}
