///refresh_saves()
with (obj_menu){
  var parent = menu_play_saves;
  ds_list_clear(parent[? "children"]);
  filename = file_find_first("saves\*.sav", 0);
  var i = 0;
  var v = 0.12;
  while(filename != ""){
    var buff = buffer_load("saves\"+filename);
    var pack = buffer_read(buff, buffer_string);
    var level = buffer_read(buff, buffer_u16);
    var btn = ui_add_child(parent, ui_create_button(0,v-0.12,1,v-0.02,lang_format("{menu.play.savegame}",pack,level),'pack_start "'+string(pack)+'" '+string(level)));
    
    if (i == 0){
      btn_play_continue[? "gp_port"] = btn;
    }
    buffer_delete(buff);
    
    filename = file_find_next();
    i++
    v+=0.1;
  }
  file_find_close();
  //btn_new_game[? "gp_port"] = ds_list_find_value(parent[? "children"],0);
}
