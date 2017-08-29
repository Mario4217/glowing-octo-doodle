///cmd_set(args)
var setval = argument0[1];
if (interface[? argument0[1]] != undefined){
  if (is_real(interface[? argument0[1]])){
    if (string_char_at(setval,1) == "+" || string_char_at(setval, 1) == "-"){
      interface[? argument0[1]] += real(argument0[2]);
    }else{
      interface[? argument0[1]] = real(argument0[2]);
    }
  }else{
    interface[? argument0[1]] = argument0[2];
  }
}else{
  interface[? argument0[1]] = argument0[2];
}
//console_print(argument0[1] + "=" +string(argument0[2]));
