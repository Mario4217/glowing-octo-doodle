///cmd_ui_draw_debug(args)
if (array_length_1d(argument0) > 1){
  var val = real(argument0[1]);
  if (val == 0 || val == 1){
    ui_draw_debug = val;
  }
}else{
  ui_draw_debug = 1-ui_draw_debug;
}
