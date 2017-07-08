///cmd_int(args)
var k = ds_map_find_first(interface);
while(k != undefined){
  console_print(k+":"+string(interface[? k]),c_white)
  k = ds_map_find_next(interface,k);
}
