///ui_add_child(element,child)
var element = argument0;
var child = argument1;
if (element[? "children"] != undefined){
  ds_list_add(element[? "children"],child);
  ds_list_mark_as_map(element[? "children"], ds_list_find_index(element[? "children"], child))
  child[? "parent"] = element;
  if (element[? "type"] == "scroll"){
    element[? "max-v"] = max(element[? "max-v"], child[? "v2"]);
  }
}
return child;
