///cmd_set_outer_deadzone(value)
var val = real(argument0[1]);
if(val < 0) {
    console_print("Can't set the outer deadzone to a negative value.");
    return false;
}
if(val < 1) {
    if(val > 0.5) {
        console_print("Can't set the outer deadzone to a value above 50%.");
        return false;
    }
    settings_map[? "outer_deadzone"] = val*100;
}
if(val > 50) {
    console_print("Can't set the outer deadzone to a value above 50%.");
    return false;
}
settings_map[? "outer_deadzone"] = val;
