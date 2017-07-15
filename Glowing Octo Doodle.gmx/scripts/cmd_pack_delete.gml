///cmd_pack_delete(args)
var packname = argument0[1];
var filename = "packs/"+base64_encode(packname)+".pak";
if (file_exists(filename)){
  file_delete(filename);
  refresh_packs();
}
