///pack_editor_reload_maps()
ds_list_clear(obj_pack_editor.maps_container[? "children"]);
var h = 0.05;
for (var i=0; i<ds_list_size(obj_pack_editor.maps); i+=1){
  var map = obj_pack_editor.maps[| i];
  var v1 = i*h;
  var v2 = (i+1)*h;
  ui_add_child(obj_pack_editor.maps_container, ui_create_label(0,v1,0.05,v2,i));
  if (i > 0){
    ui_add_child(obj_pack_editor.maps_container, ui_create_button(0.05,v1,0.1,v2,"{editor.up}","pack_switch_maps "+string(i-1)+" "+string(i)));
  }
  if (i < ds_list_size(obj_pack_editor.maps)-1){
    ui_add_child(obj_pack_editor.maps_container, ui_create_button(0.1,v1,0.2,v2,"{editor.down}","pack_switch_maps "+string(i)+" "+string(i+1)));
  }
  ui_add_child(obj_pack_editor.maps_container, ui_create_label(0.2,v1,0.8,v2,map[? "name"]));
  ui_add_child(obj_pack_editor.maps_container, ui_create_button(0.8,v1,1,v2,"{editor.remove}",'pack_rem_map "'+map[? "name"]+'"'));
};
