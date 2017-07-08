///cmd_fullscreen(args)
var val = real(argument0[1]);
if (val == 0 || val == 1){
  window_set_fullscreen(val);
}
