///ui_draw_element_toggle(x1,y1,x2,y2,state,element)
ui_style_draw_rectangle(argument0,argument1,argument2,argument3,"slider",argument4);

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var element = argument5;

var w = x2-x1;
var d = element[? "max"] - element[? "min"];
var o = ((element[? "value"] - element[? "min"])/d)*(w-w/10); //offset
ui_style_draw_rectangle(x1+o,y1,x1+o+w/10,y2,"slider.dot",argument4);
ui_style_draw_text(argument0,argument1,argument2,argument3,"slider",argument4,lang_format(argument5[? "text"], argument5[? "value"]));
