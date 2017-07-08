///statistic_save(filename);
var file = file_text_open_write(argument0);
var str = json_encode(statistics);
file_text_write_string(file,str);
file_text_close(file);
