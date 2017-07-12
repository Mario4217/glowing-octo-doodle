///bind_init()
//initialize the binding system

/*
*  This system is used to use bindings for keys. This is cool if you want to use multiple
*  keys for one thing. Also this supports axis, so you can get values from -1 to 1.
*
*  If you want to use this system you must call "bind_init()" once somewhere in the code. Best in init.
*  To add a functionality use "bind_create(group)".
*  To add keys to the group use "bind_add(group, device, key [,value])". 
*   Device can be: "K" for keyboard, "M" for mouse, "G" for gamepad and "A" for axis.
*   The key is "vk_up" or "gp_face1". value is optional and can be a value that is returned when for the bind is checked
*   Axis return by default a value between -1 and 1
*  To check for a bind use "bind_check_pressed()", "bind_check()" or "bind_check_released()"
*   These scripts return the value of the key specified in "bind_add()"
*/

globalvar bind, keymap, bind_gp_upper_deadzone;
bind = ds_map_create();
keymap = ds_map_create();
bind_gp_upper_deadzone = 0.9;

keymap[? vk_add] = "key.add";
keymap[? vk_alt] = "key.alt";
keymap[? vk_anykey] = "key.anykey";
keymap[? vk_backspace] = "key.backspace";
keymap[? vk_control] = "key.control";
keymap[? vk_decimal] = "key.decimal";
keymap[? vk_delete] = "key.delete";
keymap[? vk_divide] = "key.divide";
keymap[? vk_down] = "key.down";
keymap[? vk_end] = "key.end";
keymap[? vk_enter] = "key.enter";
keymap[? vk_escape] = "key.escape";
keymap[? vk_f1] = "key.f1";
keymap[? vk_f2] = "key.f2";
keymap[? vk_f3] = "key.f3";
keymap[? vk_f4] = "key.f4";
keymap[? vk_f5] = "key.f5";
keymap[? vk_f6] = "key.f6";
keymap[? vk_f7] = "key.f7";
keymap[? vk_f8] = "key.f8";
keymap[? vk_f9] = "key.f9";
keymap[? vk_f10] = "key.f10";
keymap[? vk_f11] = "key.f11";
keymap[? vk_f12] = "key.f12";
keymap[? vk_home] = "key.home";
keymap[? vk_insert] = "key.insert";
keymap[? vk_lalt] = "key.lalt";
keymap[? vk_lcontrol] = "key.lcontrol";
keymap[? vk_left] = "key.left";
keymap[? vk_lshift] = "key.lshift";
keymap[? vk_multiply] = "key.multiply";
keymap[? vk_nokey] = "key.nokey";
keymap[? vk_numpad0] = "key.numpad0";
keymap[? vk_numpad1] = "key.numpad1";
keymap[? vk_numpad2] = "key.numpad2";
keymap[? vk_numpad3] = "key.numpad3";
keymap[? vk_numpad4] = "key.numpad4";
keymap[? vk_numpad5] = "key.numpad5";
keymap[? vk_numpad6] = "key.numpad6";
keymap[? vk_numpad7] = "key.numpad7";
keymap[? vk_numpad8] = "key.numpad8";
keymap[? vk_numpad9] = "key.numpad9";
keymap[? vk_pagedown] = "key.pagedown";
keymap[? vk_pageup] = "key.pageup";
keymap[? vk_pause] = "key.pause";
keymap[? vk_printscreen] = "key.print";
keymap[? vk_ralt] = "key.ralt";
keymap[? vk_rcontrol] = "key.rcontrol";
keymap[? vk_return] = "key.return";
keymap[? vk_right] = "key.right";
keymap[? vk_rshift] = "key.rshift";
keymap[? vk_shift] = "key.shift";
keymap[? vk_space] = "key.space";
keymap[? vk_subtract] = "key.subtract";
keymap[? vk_tab] = "key.tab";
keymap[? vk_up] = "key.up";
keymap[? 222] = "Ä";
keymap[? 192] = "Ö";
keymap[? 186] = "Ü";
keymap[? 219] = "ß";
keymap[? 221] = "´";
keymap[? 220] = "^";
keymap[? 91] = "key.start";
keymap[? 20] = "key.caps";
keymap[? 144] = "key.numlock";
keymap[? 187] = "+";
keymap[? 191] = "#";
keymap[? 189] = "-";

show_debug_message("Using Adel Bindings");
