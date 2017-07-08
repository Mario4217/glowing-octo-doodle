///bind_to_string(keycode)
var str = argument0;
var blocks = bind_split(str,"|")
var code = real(blocks[1]);
switch (blocks[0]){
  case "K":
    if ((code >= 65 && code <= 90) || (code >= 48 && code <= 57)){
      return chr(code);
    }else{
      var k = keymap[? code];
      if (k == undefined){
        return "{key.k_"+string(code)+"}";
      }else{
        return k;
      }
    }
  break;
  case "M":
    if (code == mb_left){
      return "{key.mb_left}"
    }
    if (code == mb_right){
      return "{key.mb_right}"
    }
    if (code == mb_middle){
      return "{key.mb_middle}"
    }
  break;
  default:
    return "{key.missing}"
  break;
}
