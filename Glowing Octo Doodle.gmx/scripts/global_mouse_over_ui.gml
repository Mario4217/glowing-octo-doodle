///global_mouse_over_ui(x1,y1,x2,y2,id)
if (window_mouse_get_x() > argument0 && window_mouse_get_x() < argument2 && window_mouse_get_y() > argument1 && window_mouse_get_y() < argument3){
  ui_mouseHover = argument4;
}
return (ui_hover == argument4);
