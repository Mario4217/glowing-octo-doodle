///cmd_fullscreen(args)
var val = real(argument0[1]);
if (val == 0 || val == 1){
  if (val == 1){
    if (settings_map[? "vsync"] == true){
      window_set_fullscreen(1);
      view_wport[0] = display_get_width();
      view_hport[0] = display_get_height();
      view_wview[0] = view_wport[0];
      view_hview[0] = view_hport[0];
      surface_resize(application_surface, view_wport[0], view_hport[0])
    }else{
      console_print("V-Sync needs to be enabled to use fullscreen because of an bug in Windows 10 - Creators Update. If you are not using this opertaing system, we are sorry :(");
    }
  }else{
    var w = settings_map[? "res_width"];
    var h = settings_map[? "res_height"];
    window_set_size(w, h);
    view_wport[0] = w;
    view_hport[0] = h;
    window_set_fullscreen(0);
  }
  settings_save();
}
