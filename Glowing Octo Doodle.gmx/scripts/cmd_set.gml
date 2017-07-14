///cmd_set(args)
if (interface[? argument0[1]] != undefined){
  if (is_real(interface[? argument0[1]])){
    interface[? argument0[1]] = real(argument0[2]);
  }else{
    interface[? argument0[1]] = argument0[2];
  }
}else{
  interface[? argument0[1]] = argument0[2];
}
//console_print(argument0[1] + "=" +string(argument0[2]));
