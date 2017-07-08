///bind_add(group,device,key[, value])
//add a key to the binding
if ds_map_exists(bind,argument[0]){
  var value = 1;
  if (argument_count >= 4){
    value = argument[3]
  }
  ds_list_add(bind[? argument[0]],argument[1]+"|"+string(argument[2])+"|"+string(value));
}
