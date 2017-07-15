///ui_element_fire(element,event)
var cmd = argument0[? argument1]
if (cmd != undefined){
  cmd = string_replace(cmd,"!value",string(argument0[? "value"]));
  ds_list_add(ui_cmd_queue, cmd);
 // console_command_execute(cmd);
} 
