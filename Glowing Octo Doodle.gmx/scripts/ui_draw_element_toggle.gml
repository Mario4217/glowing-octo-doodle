///ui_draw_element_toggle(x1,y1,x2,y2,state,element)
ui_style_draw_rectangle(argument0,argument1,argument2,argument3,"toggle",argument4);

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var frame = argument5[? "frame"];
var o = ui_ease(frame, 0,(x2-x1)/2, 1);
ui_style_draw_rectangle(x1+o,y1,x1+(x2-x1)/2+o,y2,"toggle.dot",argument4);
ui_style_draw_text(argument0,argument1,argument2,argument3,"toggle",argument4,lang_format(argument5[? "text"], argument5[? "value"]));
argument5[? "frame"] = ui_interpolate(0,frame,argument5[? "value"],0.1);
