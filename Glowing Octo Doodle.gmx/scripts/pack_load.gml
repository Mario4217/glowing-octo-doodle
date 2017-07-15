///pack_load(name)
var path = "packs/"+string(base64_encode(argument0))+".pak";
if (file_exists(path)){
  ini_open(path);
  ui_set_value(txt_name, ini_read_string("info","name","unnamed"));
  ui_set_value(txt_description, ini_read_string("info","description","no description"));
  ui_set_value(sli_players, ini_read_real("info","players",1));
  ui_set_value(txt_map_hub, ini_read_string("info","hub",""));
  var index = 0;
  ds_list_clear(maps);
  while (ini_key_exists("maps",string(index))){
    var name = ini_read_string("maps",string(index),"...");
    var lvl = get_level_data(name);
    if (lvl){
      ds_list_add(maps, lvl);
    }
    index++
  }
  pack_editor_reload_maps();
  ini_close();
}
