///bind_check_pressed(group)
var key = argument0;
if (bind[? key] != undefined){
  for (i=0; i<ds_list_size(bind[? key]); i+=1){
    var F = string(ds_list_find_value(bind[? key],i));
    var a = bind_split(F,"|");
    var T = a[0];
    var N = real(a[1]);
    var V = real(a[2]);
    if (T == "K"){ //Keyboard
      if (keyboard_check_pressed(N)){
        return true;
      }
    }else if(T == "G"){ //Gamepad
      if (gamepad_button_check_pressed(0,N)){
        return true;
      }
    }else if(T == "M"){ //Mouse
      if (mouse_check_button_pressed(N)){
        return true;
      }
    }
  };
}
return false;
