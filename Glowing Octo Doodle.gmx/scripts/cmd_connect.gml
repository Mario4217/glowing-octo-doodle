///cmd_connect(args)
var ip = argument0[1];
if (array_length_1d(argument0) > 2){
  nw_port = argument0[2];
}
nw_connect(ip);
console_print("Connecting to server...");
