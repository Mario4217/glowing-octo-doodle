///cmd_set_vsync(args)
var r = real(argument0[1]);
if (r == 0 || r == 1){
  settings_map[? "vsync"] = r;
  display_reset(settings_map[? "aa"],r);
}
