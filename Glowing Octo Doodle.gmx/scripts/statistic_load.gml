///statistic_load(filename)
if (file_exists(argument0)){
  var file = file_text_open_read(argument0);
  var str = file_text_read_string(file);
  ds_map_destroy(statistics);
  statistics = json_decode(str);
  file_text_close(file);
}else{
  show_debug_message("Can't load statistics from "+argument0)
  console_print("Can't load statistics from "+argument0, c_red);
}
