///console_print(text,color);
var pos = array_height_2d(console_lines);
console_lines[pos,0] = argument[0];
if (argument_count >= 2){
  console_lines[pos,1] = argument[1];
}else{
  console_lines[pos,1] = c_white;
}
if(pos >= console_line_number){
  console_scroll += 1;
}
