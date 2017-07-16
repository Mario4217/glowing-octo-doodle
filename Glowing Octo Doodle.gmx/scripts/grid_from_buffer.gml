///grid_from_buffer(buffer, grid)
var buff = argument0;
var grid = argument1;

var bn = buffer_read(buff, buffer_u8); //type for blocks len
var bi = buffer_read(buff, buffer_u8); //type for blocks id
var w = buffer_read(buff, buffer_u16); //width
var h = buffer_read(buff, buffer_u16); //height

ds_grid_resize(grid, w, h);

var blocks = buffer_read(buff, buffer_u32); //number of blocks
var cx = 0;
var cy = 0;
for (var i=0; i<blocks; i+=1)
{
  var len = buffer_read(buff, bn);
  var tid = buffer_read(buff, bi);
  for (var j=0; j<len; j++)
  {
    grid[# cx, cy] = tid;
    cx ++;
    if (cx >= ds_grid_width(grid)){
      cx = 0;
      cy += 1;
    }
  };
};

