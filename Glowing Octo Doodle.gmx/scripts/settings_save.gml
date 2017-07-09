///settings_save()
ini_open('settings.ini');
ini_write_real("screen","aa",settings_map[? "aa"]);
ini_write_real("screen","vsync",settings_map[? "vsync"]);
ini_write_real("screen","fullscreen",settings_map[? "fullscreen"]);
ini_write_real("screen","res_width",settings_map[? "res_width"]);
ini_write_real("screen","res_height",settings_map[? "res_height"]);
ini_write_real("audio","volume_music",settings_map[? "volume_music"]);
ini_write_real("audio","volume_sfx",settings_map[? "volume_sfx"]);
ini_write_real("gamepad","inner_deadzone",settings_map[? "inner_deadzone"]);
ini_write_real("gamepad","outer_deadzone",settings_map[? "outer_deadzone"]);
ini_close();
