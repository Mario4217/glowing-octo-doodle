///console_split(string,splitter)
//same as split, but does support not splitting in string "";
var i;
var char, string_char, control;
var out;
var index = 0;
var in_string = false;
out[0] = "";
for (i=1; i<=string_length(argument0); i+=1)
{
  control = false;
  char = string_char_at(argument0,i);
  if (in_string == false){
    if (char == '"' || char == "'"){
      control = true;
      in_string = true;
      string_char = char;
    }
  }else{
    if (char == string_char){
      in_string = false;
      control = true;
    }
  }
  if (char == argument1 && !in_string){
    index ++
    out[index] = ""
  }else{
    if (!control){
      out[index] += char
    }
  }
};
return out;
