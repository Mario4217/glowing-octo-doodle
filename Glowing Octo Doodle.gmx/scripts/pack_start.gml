///pack_start(name)
if (current_pack == -1){
  var path = "packs/"+base64_encode(argument0)+".pak";
  if (file_exists(path)){
    ini_open(path);
    current_pack = ds_map_create();
    var map = current_pack;
    map[? "name"] = ini_read_string("info","name","name missing");
    map[? "current_map_index"] = 0;
    var list = ds_list_create();
    ds_map_add_list(map, "maps", list);
    
    var index = 0;
    while (ini_key_exists("maps",string(index))){
      var name = ini_read_string("maps",string(index),"...");
      var lvl = get_level_data(name);
      if (lvl){
        list[| index] = lvl;
      }
      index++
    }
    
    ini_close();
    
    var first = list[| 0];
    world_load(first[? "name"]);
  }
}
