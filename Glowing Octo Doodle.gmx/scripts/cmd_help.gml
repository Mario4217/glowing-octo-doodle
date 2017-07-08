///cmd_help(args)
if (array_length_1d(argument0) == 1){
  var list = ds_list_create();
  console_print("------ Help ------ ");
  console_print("Type help <command> to get more information about a specific command.")
  var key = ds_map_find_first(command_map);
  
  for(var i=0; i<ds_map_size(command_map); i++){
    var cmd = command_map[? key];
    ds_list_add(list,cmd[? "name"]+" - "+cmd[? "description"]);
    key = ds_map_find_next(command_map,key);
  }
  
  ds_list_sort(list,true);
  for(var i=0; i<ds_list_size(list); i++){
    console_print(list[| i]);
  }  
  ds_list_destroy(list);
}else{
  var cmdMap = command_map[? argument0[1]];
  if (cmdMap == undefined){
    console_print('The command "'+argument0[1]+'" does not exists',c_red);
  }else{
    console_print("Help for "+argument0[1]+": ");
    console_print(cmdMap[? "description"]);
    console_print("Usage: "+cmdMap[? "usage"]);
  }
}
