///grid_to_buffer(buffer, grid)
var bn = buffer_u16; //num bits type
var bi = buffer_u8; //bits to use for the tile id

var buff = argument0;
var grid = argument1;
var bnum = 1;
var bid = grid[# 0, 0];

var blocklist = ds_list_create();

buffer_write(buff,buffer_u8,bn); //first 8bits are for the type of the num
buffer_write(buff,buffer_u8,bi); //second 8bits are for the type of the id
buffer_write(buff,buffer_u16, ds_grid_width(grid)); //world width
buffer_write(buff,buffer_u16, ds_grid_height(grid)); //world height

for (var i=1; i<ds_grid_height(grid)*ds_grid_width(grid); i+=1)
{
  var cx = i mod ds_grid_width(grid);
  var cy = floor(i / ds_grid_width(grid));
  var cell = grid[# cx, cy];
  if (cell == bid){
    bnum += 1;
  }else{
    ds_list_add(blocklist, bnum);
    ds_list_add(blocklist, bid);
    bnum = 1;
    bid = cell;
  }
};

buffer_write(buff, buffer_u32, ds_list_size(blocklist)/2);
for (i=0; i<ds_list_size(blocklist); i+=2)
{
  buffer_write(buff, bn, blocklist[| i]);
  buffer_write(buff, bi, blocklist[| i+1]);
};

