///console_command_execute(string)
var args = console_split(argument0," ");
if (array_length_1d(args)>0){
  if (ds_map_exists(command_map, args[0])){
    var cmdMap = command_map[? args[0]];
    if (array_length_1d(args) > cmdMap[? "arguments"]){
      script_execute(cmdMap[? "script"],args);
    }else{
      console_print(args[0]+" expects "+string(cmdMap[? "arguments"])+" arguments!",c_red);
      console_print("Usage: "+string(cmdMap[? "usage"]),c_red);
    }
  }else{
    console_print("Unknown command: "+args[0], c_red);
  }
}
