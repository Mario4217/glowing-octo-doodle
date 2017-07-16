///nw_income_client(buffer);
switch (buffer_read(argument0, buffer_u8)){
  case NW.server_welcome:
    var version = buffer_read(argument0, buffer_string);
    if (version != GM_version){
      console_print("Server has version "+string(version)+" and you have version "+string(version)+"!",c_red);
      nw_end();
      return false;
    }
    console_print("Server is using version "+string(version));
  break;
}
