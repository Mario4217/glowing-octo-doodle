///ui_style_get(element,key,state[,class]);
var query = argument[0]+"."+string(argument[1])+":"+string(argument[2]);
if (argument_count > 3){
  if (argument[3] != ""){
    var query = "."+string(argument[3])+"."+string(argument[1])+":"+string(argument[2]);
  }
}
var val = ui_style[? query];
if (val == undefined){
  if (argument[2] == "pressed"){
    return (ui_style_get(argument[0],argument[1],"hover"));
  }
  if (argument_count > 3){
    if (argument[3] != ""){
      return (ui_style_get(argument[0],argument[1],"hover"));
    }
  }
  //fallback to none state
  var query = argument[0]+"."+string(argument[1])+":";
  var val = ui_style[? query];
  if (val == undefined){ //defaults
    switch(argument[1]){
      case "border-color": return c_black; break;
      case "border-alpha": return 1; break;
      case "background-color": return c_white; break;
      case "background-alpha": return 1; break;
      case "text-color": return c_black; break;
      case "text-halign": return fa_center; break;
      case "text-valign": return fa_middle; break;
      case "text-alpha": return 1; break;
      case "text-padding": return 1; break;
      case "animation": return 1; break;
    }
  }
}
if (val != undefined){
  return val;
}
