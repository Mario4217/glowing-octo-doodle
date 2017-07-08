///cmd_set_resolution(args)
var w = argument0[1];
var h = argument0[2];

if (w>0 && h>0){
  window_set_size(w,h);
  view_wport[0] = w;
  view_hport[0] = h;
  settings_map[? "res_width"] = w;
  settings_map[? "res_height"] = h;
}
