///ui_create_textbox(u1,v1,u2,v2,maxChars,placeholder,password)
var map = ui_create_container(argument0,argument1,argument2,argument3);
map[? "type"] = "textbox";
map[? "value"] = "";
map[? "max"] = argument4;
map[? "placeholder"] = argument5;
map[? "password"] = argument6;
return map;
