///bind_split(string,splitter)
var i;
var char;
var out;
var index = 0;
out[0] = "";
for (i=1; i<=string_length(argument0); i+=1)
{
  char = string_char_at(argument0,i);
  if char == argument1{
    index ++
    out[index] = ""
  }else{
    out[index] += char
  }
};
return out;
