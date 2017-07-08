///console_init()
globalvar console_is_open, console_scroll, console_line_number, console_lines, console_last_cmd, console_string, command_map, console_last_key;
console_is_open = false;
console_scroll = 0;
console_line_number = 8;
console_lines[0,0] = "Running version "+string(GM_version);
console_lines[0,1] = c_lime;
console_string = "";
console_last_press = 0;
command_map = ds_map_create();
console_history = ds_list_create();
console_history_index = -1;
interface = ds_map_create();

show_debug_message("Using Adel Console");
