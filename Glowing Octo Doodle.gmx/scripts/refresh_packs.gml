///refresh_packs()
with (obj_menu){
  var parent = menu_editor_packs;
  ds_list_clear(parent[? "children"]);
  var btn_new = ui_add_child(parent, ui_create_button(0,0,1,0.1,"{menu.editor.new_pack}","pack_editor"));
  btn_packs[? "gp_port"] = btn_new;
  filename = file_find_first("packs\*.pak", 0);
  var i = 0;
  var v = 0.12;
  while(filename != ""){
    //editor
    parent = menu_editor_packs;
    var b = ui_split(filename,".");
    var name = base64_decode(b[0]);
    var btn = ui_add_child(parent, ui_create_button(0,v,1,v+0.1,name,'pack_editor "'+string(name)+'"'));
    var del = ui_add_child(btn, ui_create_button(0.8, 0, 1, 1, "{menu.delete}", 'pack_delete "'+string(name)+'"'));
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
    
    //play
    parent = menu_play_packs;
    var btn = ui_add_child(parent, ui_create_button(0,v-0.12,1,v-0.02,name,'pack_start "'+string(name)+'"'));
    
    filename = file_find_next();
    i++
    v+=0.1;
  }
  file_find_close();
  btn_new_game[? "gp_port"] = ds_list_find_value(parent[? "children"],0);
}
