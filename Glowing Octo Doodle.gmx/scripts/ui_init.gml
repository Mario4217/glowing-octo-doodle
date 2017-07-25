///ui_init()
globalvar ui_mouseHover, ui_hover, ui_style, ui_draw_debug, ui_current_class, ui_current_hover, ui_gamepad_position;
globalvar ui_m_pre_x, ui_m_pre_y, ui_gamepad_active, ui_mouse_moved, ui_gamepad_hold_time, ui_gamepad_hold_direction;
globalvar ui_cmd_queue;
ui_hover = -1;
ui_mouseHover = -1;
ui_draw_debug = false;
ui_current_class = "";
ui_current_hover = 0;
ui_gamepad_position = -1;
ui_gamepad_active = false;
ui_gamepad_stick_moved = false;
ui_m_pre_x = window_mouse_get_x();
ui_m_pre_y = window_mouse_get_y();
ui_mouse_moved = true;
ui_gamepad_hold_time = 0;
ui_gamepad_hold_direction = 0;
ui_cmd_queue = ds_list_create();

ui_style_init();
