///cmd_set_inner_deadzone(value)
var val = real(argument0[1]);
if(val < 0) {
    console_print("Can't set the inner deadzone to a negative value.");
    return false;
}
if(val < 1) {
    if(val > 0.5) {
        console_print("Can't set the inner deadzone to a value above 50%.");
        return false;
    }
    settings_map[? "inner_deadzone"] = val*100;
    gamepad_set_axis_deadzone(0, val);
}
if(val > 50) {
    console_print("Can't set the inner deadzone to a value above 50%.");
    return false;
}
settings_map[? "inner_deadzone"] = val;
gamepad_set_axis_deadzone(0, val/100);
settings_save();
