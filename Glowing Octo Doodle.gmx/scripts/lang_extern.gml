///lang_extern(file)
var file, str, mode, i, char, val, key;
if (file_exists(argument0)){
  file=file_text_open_read(argument0);
  if (file){
    while (!file_text_eof(file))
    {
      str=file_text_read_string(file)
      mode=0;
      val="";
      key="";
      for (i=1; i<string_length(str)+1; i+=1){
        char=string_char_at(str,i)
        if (char == ":" and mode == 0){
          mode=1
          val = string_copy(str,i+1,string_length(str)-i)
        }else{
        if (mode==0){
          key+=char
        }
        else{
         //val+=char
        }}
      };
      lang_add(key,val)
      file_text_readln(file)
    };
    file_text_close(file)
  }
}else{
  show_debug_message("[Lang]File: "+argument0+" does not exists!");
  console_print('[Lang]File "'+argument0+'" does not exist!',c_red);
}
