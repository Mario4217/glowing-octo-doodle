///ui_style_init();
ui_style = ds_map_create();


var elements = ds_list_create();
var modes = ds_list_create();
ds_list_add(elements, "label", "draggable", "button", "sprite", "texture", "radio", "slider", "textbox", "spinner", "toggle", "progress");
ds_list_add(modes, "hover", "", "pressed")

for (i=0; i<ds_list_size(elements); i+=1){
  var element = elements[| i];
  for (j=0; j<ds_list_size(modes); j+=1){
    var mode = modes[| j];
    ui_style[? element+".border-color:"+mode] = c_black;
    ui_style[? element+".border-alpha:"+mode] = 1;
    ui_style[? element+".background-color:"+mode] = c_white;
    ui_style[? element+".background-alpha:"+mode] = 1;
    ui_style[? element+".text-color:"+mode] = c_black;
    ui_style[? element+".text-halign:"+mode] = fa_center;
    ui_style[? element+".text-valign:"+mode] = fa_middle;
    ui_style[? element+".text-alpha:"+mode] = 1;
    ui_style[? element+".text-padding:"+mode] = 1;
    ui_style[? element+".animation:"+mode] = 1;
  };
};

ds_list_destroy(elements);


ui_style[? "button.background-color:hover"] = c_ltgray;
ui_style[? "button.background-color:pressed"] = c_dkgray;
ui_style[? "button.animation:"] = 1;
ui_style[? "button.text-color:pressed"] = c_white;
ui_style[? "label.background-alpha:"] = 0.4;
ui_style[? "label.background-alpha:hover"] = 0.4;
ui_style[? "label.background-alpha:pressed"] = 0.4;
ui_style[? "toggle.dot.background-color:"] = c_lime;
ui_style[? "toggle.background-color:hover"] = c_ltgray;
ui_style[? "toggle.dot.border-radius:"] = 10;
ui_style[? "radio.dot.background-color:"] = c_lime;
ui_style[? "radio.background-color:hover"] = c_ltgray;
ui_style[? "slider.dot.background-color:"] = c_lime;
ui_style[? "slider.background-color:hover"] = c_ltgray;
ui_style[? "textbox.text-halign:"] = fa_left;
ui_style[? "textbox.background-color:hover"] = c_ltgray;
ui_style[? "textbox.background-color:active"] = c_navy;
ui_style[? "textbox.text-color:active"] = c_white;
ui_style[? "textbox.placeholder.text-color:"] = c_ltgray;
ui_style[? "textbox.placeholder.text-color:hover"] = c_white;
ui_style[? "draggable.text-halign:"] = fa_left;
ui_style[? "draggable.text-valign:"] = fa_top;
ui_style[? "draggable.text-color:"] = c_white;
ui_style[? "draggable.background-color:"] = c_dkgray;
ui_style[? "binding.background-color:hover"] = c_ltgray;
ui_style[? "binding.background-color:active"] = c_navy;
ui_style[? "binding.text-color:active"] = c_white;
ui_style[? "binding.text-color:hover"] = c_white;
ui_style[? "progress.fill.background-color:"] = c_lime;
