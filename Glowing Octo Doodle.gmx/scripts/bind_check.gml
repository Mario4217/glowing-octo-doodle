///bind_check(key)
//check for a bind
var key = argument0;
if (bind[? key] != undefined){
  for (i=0; i<ds_list_size(bind[? key]); i+=1){
    var F = string(ds_list_find_value(bind[? key],i));
    var a = bind_split(F,"|");
    var T = a[0];
    var N = real(a[1]);
    var V = real(a[2]);
    if (T == "K"){ //Keyboard
      if (keyboard_check(N)){
        return V;
      }
    }else if(T == "G"){ //Gamepad
      if (gamepad_button_check(0,N)){
        return V;
      }
    }else if(T == "M"){ //Mouse
      if (mouse_check_button(N)){
        return V;
      }
    }else if(T == "A"){ //axis on Gamepad
      return gamepad_axis_value(0, N)*V;
    }
  };
}
return false;
