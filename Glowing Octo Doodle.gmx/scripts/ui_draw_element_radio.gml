///ui_draw_element_toggle(x1,y1,x2,y2,state,element)
ui_style_draw_rectangle(argument0,argument1,argument2,argument3,"radio",argument4);

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var element = argument5;

if (element[? "parent"] != undefined){
  var parent = element[? "parent"];
  if (parent[? "value"] == element[? "value"]){
    ui_style_draw_rectangle(x1,y1,x2,y2,"radio.dot",argument4);
  }
}
ui_style_draw_text(argument0,argument1,argument2,argument3,"radio",argument4,lang_format(argument5[? "text"]));
