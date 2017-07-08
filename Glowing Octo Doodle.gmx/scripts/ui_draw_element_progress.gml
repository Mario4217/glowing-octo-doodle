///ui_draw_element_progress(x1,y1,x2,y2,state,element)
ui_style_draw_rectangle(argument0,argument1,argument2,argument3,"progress",argument4);
ui_style_draw_rectangle(argument0,argument1,argument0+(argument2-argument0)*argument5[? "progress"],argument3,"progress.fill",argument4);

ui_style_draw_text(argument0,argument1,argument2,argument3,"progress",argument4,lang_format(argument5[? "text"], argument5[? "progress"]*100));
