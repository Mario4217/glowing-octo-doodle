///cmd_set_aa(args)
var r = real(argument0[1]);
if (r == 0 || r == 2 || r == 4 || r == 8){
  settings_map[? "aa"] = r;
  display_reset(r,settings_map[? "vsync"]);
}
settings_save();
