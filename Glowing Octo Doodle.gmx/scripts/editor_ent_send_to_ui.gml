///editor_ent_send_to_ui()
ds_list_clear(obj_editor.ent_label_attributes[? "children"]);
var src_attr = src_map[? "attr"];
var key = ds_map_find_first(src_attr)
for (var i=0; i<ds_map_size(src_attr); i+=1){
  var name = dictionary_attribute[? key];
  var line = 0.4;
  var map = src_attr[? key];
  if (map[? "type"] == buffer_u8 || map[? "type"] == buffer_u16 || map[? "type"] == buffer_u32){
    var element = ui_create_spinner(line,i*0.2,1,i*0.2+0.2,map[? "min"],map[? "max"],1); 
  }else if(map[? "type"] == buffer_string){
    var element = ui_create_textbox(line,i*0.2,1,i*0.2+0.2,map[? "max"],"",false); 
  }else if(map[? "type"] == buffer_bool){
    var element = ui_create_toggle(line, i*0.2, 1, i*0.2+0.2, ""); 
  }
  ui_set_event(element,"onchange", "editor_update_ent " + string(key) + " !value");
  ui_set_value(element, attr[? key]);
  ui_add_child(obj_editor.ent_label_attributes, ui_create_label(0, i*0.2, line, i*0.2+0.2, name));
  ui_add_child(obj_editor.ent_label_attributes, element);
  attr_ui[? key] = element;
  key = ds_map_find_next(src_attr, key);
};
ui_set_text(obj_editor.ent_label, lang_format("{editor.selected_entity}",src_map[? "name"]));
