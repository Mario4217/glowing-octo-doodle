///ui_draw(element)
var element = argument0;
if (element[? "visible"]){
  
  var w = view_wport[0];
  var h = view_hport[0];
  
  if (element[? "parent"] == -1){
    var x1 = element[? "u1"] * w;
    var y1 = element[? "v1"] * h;
    var x2 = element[? "u2"] * w;
    var y2 = element[? "v2"] * h;
  }else{
    var parent = element[? "parent"];
    var x1 = parent[? "px1"]+parent[? "pw"] * element[? "u1"];
    var y1 = parent[? "py1"]+parent[? "ph"] * element[? "v1"];
    var x2 = parent[? "px1"]+parent[? "pw"] * element[? "u2"];
    var y2 = parent[? "py1"]+parent[? "ph"] * element[? "v2"];
  }
  
  element[? "px1"] = x1;
  element[? "py1"] = y1;
  element[? "pw"] = x2-x1;
  element[? "ph"] = y2-y1;
  
  var state = "";
  ui_current_class = element[? "class"];
  
  if (window_mouse_get_x() > x1 && window_mouse_get_x() < x2 && window_mouse_get_y() > y1 && window_mouse_get_y() < y2){
    if (element[? "type"] != "container" || ui_draw_debug)
    ui_mouseHover = element;
  }
  
  if (element[? "pressed"] == undefined){
    element[? "pressed"] = false;
  }
  var hover = (element == ui_hover);
  var pressed = false;
  var click_start = false;
  
  var deselect = false;
  if (mouse_check_button_pressed(mb_left)){
    var deselect = true;
  }
  
  if (hover){
    if (mouse_check_button_pressed(mb_left)){
      element[? "pressed"] = true;
      click_start = true;
    }
    if (mouse_check_button_released(mb_left) && element[? "pressed"]){
      element[? "pressed"] = false;
      ui_element_fire(element,"onclick");
      pressed = true;
    }
  }
  if (element[? "pressed"]){
    if (mouse_check_button_released(mb_left)){
      element[? "pressed"] = false;
    }
  }
  
  if (hover){
    state = "hover";
  }
  if (element[? "pressed"]){
    state = "pressed";
  }
  
  element[? "hoverness"] = ui_interpolate(0,element[? "hoverness"],hover,0.2);
  ui_current_hover = element[? "hoverness"];
  
  switch (element[? "type"]){
    case "label":
      ui_draw_element_label(x1,y1,x2,y2,state,element[? "text"]);
    break;
    case "button":
      ui_draw_element_button(x1,y1,x2,y2,state,element[? "text"]);
    break;
    case "toggle":
      if (pressed){
        element[? "value"] = 1-element[? "value"];
        ui_element_fire(element,"onchange");
      }
      ui_draw_element_toggle(x1,y1,x2,y2,state,element);
    break;
    case "radio":
      if (pressed){
        parent[? "value"] = element[? "value"];
        ui_element_fire(parent,"onchange");
      }
      ui_draw_element_radio(x1,y1,x2,y2,state,element);   
    break;
    case "slider":
      if (element[? "pressed"]){
        var w = (x2-x1);
        var v = element[? "value"]
        v = round((clamp((window_mouse_get_x()-x1)/w,0,1) * (element[? "max"] - element[? "min"]) + element[? "min"])/element[? "snap"])*element[? "snap"];
        if (v != element[? "value"]){
          ui_element_fire(element,"onchange");
          element[? "value"] = v;
        }
      }
      ui_draw_element_slider(x1,y1,x2,y2,state,element);
    break;
    case "textbox":
      if (deselect){
        element[? "active"] = false;
        keyboard_string = "";
        ui_element_fire(element,"onchange");
      }
      if (pressed){
        element[? "active"] = true;
        keyboard_string = element[? "value"];
      }
      if (element[? "active"]){
        if (keyboard_check(vk_control)){
          if (keyboard_check_pressed(ord('V'))){
            if (clipboard_has_text()){
              keyboard_string += clipboard_get_text();
            }
          }
          if (keyboard_check_pressed(ord('C'))){
            clipboard_set_text(keyboard_string);
          }
          if (keyboard_check_pressed(ord('X'))){
            clipboard_set_text(keyboard_string);
            keyboard_string = "";
          }
        }
        element[? "value"] = string_copy(keyboard_string,1,element[? "max"]);
        state = "active"
        if (keyboard_check_pressed(vk_enter)){
          element[? "active"] = false;
          ui_element_fire(element,"onchange");
          keyboard_string = "";
        }
      }
      ui_draw_element_textbox(x1,y1,x2,y2,state,element);
    break;
    case "draggable":
      var mU = window_mouse_get_x() / view_wport[0];
      var mV = window_mouse_get_y() / view_hport[0];
      if (click_start){
        element[? "dragU"] = element[? "u1"] - mU;
        element[? "dragV"] = element[? "v1"] - mV;
        var parent = element[? "parent"];
        if (parent != undefined){
          parent[? "top"] = element;
        }
      }
      if (element[? "pressed"]){ //drag
        var w = element[? "u2"]-element[? "u1"];
        var h = element[? "v2"]-element[? "v1"];
        element[? "u1"] = mU + element[? "dragU"];
        element[? "v1"] = mV + element[? "dragV"];
        if (element[? "clamp"]){
          element[? "u1"] = clamp(element[? "u1"],0,1-w);
          element[? "v1"] = clamp(element[? "v1"],0,1-h);
        }
        element[? "u2"] = element[? "u1"] + w;
        element[? "v2"] = element[? "v1"] + h;
        element[? "value"] = clamp((window_mouse_get_x()-x1)/w,0,1);
      }
      ui_draw_element_draggable(x1,y1,x2,y2,state,element[? "text"]);
    break;
    case "binding":
      var code = bind_get(element[? "bind-group"], element[? "bind-index"]);
      var text = bind_string(code);
      if (pressed){
        element[? "active"] = true;
      }
      if (element[? "active"]){
        state = "active"
        if (keyboard_check_pressed(vk_anykey)){
          bind_set(element[? "bind-group"], element[? "bind-index"], "K", keyboard_lastkey, element[? "bind-val"]);
          element[? "active"] = false;
        }
        if (mouse_check_button_pressed(mb_any)){
          bind_set(element[? "bind-group"], element[? "bind-index"], "M", mouse_lastbutton, element[? "bind-val"]);
          element[? "active"] = false;
        }
      }
      ui_draw_element_binding(x1,y1,x2,y2,state,text);
    break;
    case "progress":
      ui_draw_element_progress(x1,y1,x2,y2,state,element);
    break;
  }
  
  if (element[? "top"] != undefined){
    var index = ds_list_find_index(element[? "children"],element[? "top"]);
    ds_list_delete(element[? "children"],index);
    ds_list_add(element[? "children"],element[? "top"]);
  }
  
  if (ui_draw_debug){
    draw_set_color(c_black);
    draw_set_alpha(0.1);
    for (i=0; i<11; i+=1)
    {
      draw_line(x1,y1+(y2-y1)*i/10,x2,y1+(y2-y1)*i/10);
      draw_line(x1+(x2-x1)*i/10,y1,x1+(x2-x1)*i/10,y2);
    };
    draw_set_alpha(1);
    draw_set_color(c_blue);
    w = 1;
    if(hover){
      draw_set_color(c_lime);
      w = 2;
    }
    draw_line_width(0,y1,view_wport[0],y1,w);
    draw_line_width(0,y2,view_wport[0],y2,w);
    draw_line_width(x1,0,x1,view_hport[0],w);
    draw_line_width(x2,0,x2,view_hport[0],w);
  }
  
  ui_draw_list(element[? "children"]);
}
