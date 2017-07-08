///ui_element_fire(element,event)
var cmd = argument0[? argument1]
if (cmd != undefined){
  cmd = string_replace(cmd,"!value",string(argument0[? "value"]));
  console_command_execute(cmd);
} 
