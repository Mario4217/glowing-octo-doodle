///ui_hexcode_to_color(string)
var o = (string_char_at(argument0,1) == "$")
var r = ui_hex_to_dec(string_copy(argument0,1+o,2));
var g = ui_hex_to_dec(string_copy(argument0,3+o,2));
var b = ui_hex_to_dec(string_copy(argument0,5+o,2));
return make_color_rgb(r,g,b);
