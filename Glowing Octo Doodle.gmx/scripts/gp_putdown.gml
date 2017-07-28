///gp_putdown(pawn, x, y)
var pawn = argument0;
var xx = argument1;
var yy = argument2;
pawn.pickup.x = xx;
pawn.pickup.y = yy;
//pawn.pickup.visible = true;
pawn.pickup.carrier = -1;
if (gameplay_object_have_tag(pawn.pickup.src_map[? "id"],"clip")){
  pawn.pickup.clip.x = pawn.pickup.x - pawn.pickup.sprite_xoffset;
  pawn.pickup.clip.y = pawn.pickup.y - pawn.pickup.sprite_yoffset;
}
pawn.pickup = -1;
