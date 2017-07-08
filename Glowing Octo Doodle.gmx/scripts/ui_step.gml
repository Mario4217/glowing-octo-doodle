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

if (ui_gamepad_position != -1){
  var parent = ui_gamepad_position[? "parent"];
  var children = parent[? "children"];
  var pos = ds_list_find_index(children, ui_gamepad_position);
  if (gamepad_button_check_pressed(0,gp_padr)){
    ui_gamepad_active = true;
    if (ui_gamepad_position[? "gp_right"] != undefined){
      ui_gamepad_position = ui_gamepad_position[? "gp_right"];
    }
  }
  if (gamepad_button_check_pressed(0,gp_padl)){
    ui_gamepad_active = true;
    if (ui_gamepad_position[? "gp_left"] != undefined){
      ui_gamepad_position = ui_gamepad_position[? "gp_left"];
    }
  }
  
  if (gamepad_button_check_pressed(0,gp_padd)){
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
  if (gamepad_button_check_pressed(0,gp_padu)){
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
