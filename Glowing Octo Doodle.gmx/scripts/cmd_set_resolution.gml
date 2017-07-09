///cmd_set_resolution(args)
var w = real(argument0[1]);
var h = real(argument0[2]);
show_debug_message("Set Resolution to "+string(w)+"x"+string(h));

if (w>0 && h>0){
  window_set_size(w,h);
  view_wport[0] = w;
  view_hport[0] = h;
  settings_map[? "res_width"] = w;
  settings_map[? "res_height"] = h;
  surface_resize(application_surface, view_wport[0], view_hport[0]);
}
settings_save();
