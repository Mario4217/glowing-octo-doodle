///ui_style_load(filename)
if (file_exists(argument0)){
  file=file_text_open_read(argument0);
  if (file){
    while (!file_text_eof(file))
    {
      str=file_text_read_string(file)
      var blocks = ui_split(str,"=");
      if (array_length_1d(blocks) > 1){
        var val = string_trim(blocks[1]);
        if (string_char_at(val,1) == "$"){
          val = ui_string_to_color(val);
        }
        ui_style[? blocks[0]] = real(val);
        file_text_readln(file);
      }
    };
    file_text_close(file)
  }
}else{
  console_print('[Style]File "'+argument0+'" does not exist!',c_red);
}
