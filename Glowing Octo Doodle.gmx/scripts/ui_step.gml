///ui_step()
ui_hover = ui_mouseHover;
ui_mouseHover = -1;

ui_mouse_moved = false;
if (ui_m_pre_x != window_mouse_get_x() || ui_m_pre_y != window_mouse_get_y()){ //if mouse have moved
  ui_gamepad_active = 0;
  ui_mouse_moved = true;
}
ui_m_pre_x = window_mouse_get_x();
ui_m_pre_y = window_mouse_get_y();

gp_up = gamepad_button_check_pressed(0,gp_padu);
gp_right = gamepad_button_check_pressed(0,gp_padr);
gp_down = gamepad_button_check_pressed(0,gp_padd);
gp_left = gamepad_button_check_pressed(0,gp_padl);

if (gamepad_axis_value(0, gp_axislh) > 0.9){
  if (ui_gamepad_stick_moved == false){
    ui_gamepad_stick_moved = true;
    gp_right = true;
  }
}
if (gamepad_axis_value(0, gp_axislh) < -0.9){
  if (ui_gamepad_stick_moved == false){
    ui_gamepad_stick_moved = true;
    gp_left = true;
  }
}
if (gamepad_axis_value(0, gp_axislv) > 0.9){
  if (ui_gamepad_stick_moved == false){
    ui_gamepad_stick_moved = true;
    gp_down = true;
  }
}
if (gamepad_axis_value(0, gp_axislv) < -0.9){
  if (ui_gamepad_stick_moved == false){
    ui_gamepad_stick_moved = true;
    gp_up = true;
  }
}
if (ui_gamepad_stick_moved == true){
  if (abs(gamepad_axis_value(0, gp_axislv)+gamepad_axis_value(0,gp_axislh))==0){
    ui_gamepad_stick_moved = false;
  }
}


if (ui_gamepad_position != -1){
  var parent = ui_gamepad_position[? "parent"];
  var children = parent[? "children"];
  var pos = ds_list_find_index(children, ui_gamepad_position);
  if (gp_right){
    ui_gamepad_active = true;
    if (ui_gamepad_position[? "gp_right"] != undefined){
      ui_gamepad_position = ui_gamepad_position[? "gp_right"];
    }
  }
  if (gp_left){
    ui_gamepad_active = true;
    if (ui_gamepad_position[? "gp_left"] != undefined){
      ui_gamepad_position = ui_gamepad_position[? "gp_left"];
    }
  }
  
  if (gp_down){
    ui_gamepad_active = true;
    if (ui_gamepad_position[? "gp_down"] != undefined){
      ui_gamepad_position = ui_gamepad_position[? "gp_down"];
    }else{
      if (pos == ds_list_size(children)-1){
        ui_gamepad_position = children[| 0];
        pos = 0;
      }else{
        ui_gamepad_position = children[| pos+1];
        pos += 1;
      }
      while(ui_gamepad_position[? "gp_jump"]){
        if (pos == ds_list_size(children)-1){
          ui_gamepad_position = children[| 0];
          pos = 0;
        }else{
          ui_gamepad_position = children[| pos+1];
          pos += 1;
        }
      }
    }
  }
  if (gp_up){
    ui_gamepad_active = true;
    if (ui_gamepad_position[? "gp_up"] != undefined){
      ui_gamepad_position = ui_gamepad_position[? "gp_up"]
    }else{
      if (pos == 0){
        ui_gamepad_position = children[| ds_list_size(children)-1];
        pos = ds_list_size(children)-1;
      }else{
        ui_gamepad_position = children[| pos-1];
        pos -= 1;
      }
      while(ui_gamepad_position[? "gp_jump"]){
        if (pos == 0){
          ui_gamepad_position = children[| ds_list_size(children)-1];
          pos = ds_list_size(children)-1;
        }else{
          ui_gamepad_position = children[| pos-1];
          pos -= 1;
        }
      }
    }
  }
}
