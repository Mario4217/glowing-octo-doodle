///cmd_get(args)
var val = interface[? argument0[1]];
if (val != undefined){
  console_print(argument0[1]+": "+string(val), c_white);
}else{
  console_print(argument0[1]+" ist not defined!",c_red);
}
