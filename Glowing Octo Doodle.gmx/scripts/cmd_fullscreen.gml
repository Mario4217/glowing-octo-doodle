///cmd_fullscreen(args)
var val = real(argument0[1]);
if (val == 0 || val == 1){
  window_set_fullscreen(val);
  if (val == 1){
    view_wport[0] = display_get_width();
    view_hport[0] = display_get_height();
  }else{
    var w = settings_map[? "res_width"];
    var h = settings_map[? "res_height"];
    window_set_size(w, h);
    view_wport[0] = w;
    view_hport[0] = h;
  }
}
