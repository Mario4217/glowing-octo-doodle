///editor_ent_update_ui()
var children = obj_editor.ent_label_attributes[? "children"];
var src_attr = src_map[? "attr"];
var key = ds_map_find_first(src_attr);
for (var i=0; i<ds_map_size(src_attr); i+=1){
  element = attr_ui[? key];
  ui_set_value(element, attr[? key]);
  key = ds_map_find_next(src_attr, key);
};
ui_set_text(obj_editor.ent_label, lang_format("{editor.selected_entity}",src_map[? "name"]));
