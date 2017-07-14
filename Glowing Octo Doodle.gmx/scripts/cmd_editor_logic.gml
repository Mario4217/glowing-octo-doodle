///cmd_editor_logic(args);
if (room == rm_editor){
  if (obj_editor.inst_selected != -1){
    
    if (instance_exists(obj_editor.inst_selected)){
      ds_list_clear(obj_editor.logic_window[? "children"]);
      var tar = obj_editor.inst_selected;
      var outputs = tar.src_map[? "outputs"];
      var v = 1;
      var h = 1;
      for (var i=0; i<ds_list_size(outputs); i+=1){ //event titles
        var oid = outputs[| i];
        var label = ui_add_child(obj_editor.logic_window, ui_create_label(0,v,1,v+h,dictionary_event[? oid]));
        ui_add_child(label, ui_create_button(0.9,0,1,1,"+","editor_start_link "+string(oid)));
        v += 1;
        for (var j=0; j<ds_list_size(tar.outputs); j+=1){
          var link = tar.outputs[| j];
          if (link[? "event"] == oid){ //usage of the current event in itteration
            var event = dictionary_event[? oid];
            var action = dictionary_action[? link[? "action"]];
            var name = link[? "target"].src_map[? "name"];
            var label = ui_add_child(obj_editor.logic_window, ui_create_label(0,v,1,v+h,lang_format("{editor.link}",event,action,name)));
            ui_add_child(label, ui_create_button(0,0,0.1,1,"X","editor_cut_link "+string(j)));
            v += 1;
          }
        }
      }
      obj_editor.logic_window[? "visible"] = true;
    }
  }
}
