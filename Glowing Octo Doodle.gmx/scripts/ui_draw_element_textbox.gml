///ui_draw_element_textbox(x1,y1,x2,y2,state,element);
ui_style_draw_rectangle(argument0,argument1,argument2,argument3,"textbox",argument4);
if (argument5[? "value"] == ""){
  ui_style_draw_text(argument0,argument1,argument2,argument3,"textbox.placeholder",argument4,argument5[? "placeholder"]);
}else{
  var text = argument5[? "value"];
  if (argument5[? "password"]){
    text = "";
    repeat(string_length(argument5[? "value"])){
      text += '*';
    }
  }
  if (argument5[? "active"]){
    if (current_time mod 1500 > 750){
      text += "|";
    }
  }
  ui_style_draw_text(argument0,argument1,argument2,argument3,"textbox",argument4,text);
}
