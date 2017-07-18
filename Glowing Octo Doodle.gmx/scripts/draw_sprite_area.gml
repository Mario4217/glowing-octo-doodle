///draw_sprite_area(sprite, image, x1, y1, x2, y2);
//draws a sprite tiles fiting to an area;
var spr = argument0;
var img = argument1;
var x1 = argument2;
var y1 = argument3;
var x2 = argument4;
var y2 = argument5;
var w = x2 - x1;
var h = y2 - y1;
var sw = sprite_get_width(spr);
var sh = sprite_get_height(spr);
for (var i=0; i<floor(w/sw); i+=1){
  for (var j=0; j<floor(h/sh); j+=1){
     draw_sprite_ext(spr, img, x1+i*sw, y1+j*sh,1,1,0, image_blend, image_alpha);
  };
  draw_sprite_part_ext(spr, img, 0, 0, sw, h mod sh, x1+i*sw, y1+j*sh, 1, 1, image_blend, image_alpha);
};
for (j=0; j<floor(h/sh); j+=1)
{
  draw_sprite_part_ext(spr, img, 0, 0, w mod sw, sh, x1+i*sw, y1+j*sh, 1, 1, image_blend, image_alpha);
};
draw_sprite_part_ext(spr, img, 0, 0, w mod sw, h mod sh, x1+i*sw , y1+j*sh, 1, 1, image_blend, image_alpha);

