///ui_draw_list(list)
var list = argument0;
if (ds_exists(list,ds_type_list)){
  for (var i=0; i<ds_list_size(list); i+=1)
  {
    var element = list[| i];
    ui_draw(element);
  };
}
