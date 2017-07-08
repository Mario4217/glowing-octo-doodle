///bind_check_pressed(group)
var key = argument0;
if (bind[? key] != undefined){
  for (i=0; i<ds_list_size(bind[? key]); i+=1){
    var F = string(ds_list_find_value(bind[? key],i));
    var a = bind_split(F,"|");
    var T = a[0];
    var N = a[1];
    var V = a[2];
    if (keyboard_check_pressed(N) and T == "K"){
     return V;
    }
    if (gamepad_button_check_pressed(0,N) and T == "G"){
      return V;
    }
    if (mouse_check_button_pressed(N) and T == "M"){
      return V;
    }
  };
}
return false;
