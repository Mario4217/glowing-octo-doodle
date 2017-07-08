///console_draw()
if (console_is_open){
  draw_set_font(ft_console);
  draw_set_color(c_dkgray);
  draw_rectangle(0,0,view_wport[0],console_line_number*16+22,false);
  draw_set_color(c_white);
  draw_line(0,console_line_number*16+4,view_wport[0],console_line_number*16+4);
  for (var i=0; i<min(console_line_number, array_height_2d(console_lines)); i++){
    var line_index = i + console_scroll;
    draw_set_color(console_lines[line_index,1]);
    draw_text(0,i*16,console_lines[line_index,0]);
  }
  draw_set_color(c_white);
  var yy = console_line_number*16+4
  draw_text(0,yy,keyboard_string);
  if (current_time mod 2000 > 1000 || current_time - console_last_press < 1000){
    draw_line(string_width(keyboard_string),yy+2,string_width(keyboard_string),yy+14)
  }
  if (keyboard_check_pressed(vk_anykey)){
    console_last_press = current_time;
  }
  if (keyboard_check_pressed(vk_enter)){
    console_print("]"+keyboard_string,c_orange);
    if (keyboard_string != ""){
      console_command_execute(keyboard_string);
      ds_list_insert(console_history,0,keyboard_string);
      console_history_index = -1;
    }
    keyboard_string = "";
  }
  if (keyboard_check_pressed(vk_up)){
    console_history_index ++;
    console_history_index = min(console_history_index, ds_list_size(console_history));
    keyboard_string = console_history[| console_history_index];
  }
  if (keyboard_check_pressed(vk_down)){
    console_history_index --;
    console_history_index = max(console_history_index,-1);
    if (console_history_index == -1){
      keyboard_string = "";
    }else{
      keyboard_string = console_history[| console_history_index];
    }
  }
  
  if (array_height_2d(console_lines) > console_line_number){
    console_scroll += mouse_wheel_down();
    console_scroll -= mouse_wheel_up();
    console_scroll = clamp(console_scroll, 0, array_height_2d(console_lines)-console_line_number);
    draw_set_color(c_white);
    draw_set_alpha(0.3);
    var console_height = console_line_number*16;
    var pos = (console_scroll / array_height_2d(console_lines))*console_height;
    var h = max(console_line_number / array_height_2d(console_lines)*console_height,1);
    draw_rectangle(view_wport[0]-16,pos,view_wport[0],pos+h,false);
    draw_set_alpha(1);
  }
}
