///settings_load()
if (file_exists("settings.ini")){
  ini_open("settings.ini");
  settings_map[? "aa"] = ini_read_real("screen","aa",0);
  var vsync = ini_read_real("screen","vsync",1);
  var fullscreen =ini_read_real("screen","fullscreen",0);
  var w = ini_read_real("screen","res_width",1280);
  var h = ini_read_real("screen","res_height",720);
  settings_map[? "volume_music"] = ini_read_real("audio","volume_music",50);
  settings_map[? "volume_sfx"] = ini_read_real("audio","volume_sfx",50);
  var inner_deadzone = ini_read_real("gamepad","inner_deadzone",0.1);
  var outer_deadzone = ini_read_real("gamepad","outer_deadzone",0.1)
  ini_close();
  console_command_execute("set_resolution "+string(w)+" "+string(h));
  console_command_execute("set_vsync "+string(vsync));
  console_command_execute("fullscreen"+string(fullscreen));
  console_command_execute("set_inner_deadzone "+string(inner_deadzone));
  console_command_execute("set_outer_deadzone "+string(outer_deadzone));
}
