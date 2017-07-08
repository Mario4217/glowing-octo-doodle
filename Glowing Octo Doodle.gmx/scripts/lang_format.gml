///lang_format(string, p1, p2...)
var str = argument[0];

var mode = 0;
var out = "";
var key = "";
for (var i=1; i<=string_length(str); i++){
  var char = string_char_at(str,i);
  if (mode == 0){
    if( char == "{"){
      mode = 1;
      key = "";
    }else{
      out += char;
    }
  }else{
    if (char == "}"){
      mode = 0;
      out += lang_get(key);
    }else{
      key += char;
    }
  }
}
str = out;

for (var i=1; i<argument_count; i++){
  str = string_replace(str,"["+string(i)+"]",string(argument[i]));
}

return str;
