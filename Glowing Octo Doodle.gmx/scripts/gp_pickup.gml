///gp_pickup(instance, pawn)
var inst = argument0;
var pawn = argument1;

if (pawn.pickup != -1){
  return false;
  //something went wrong!
}

inst.carrier = pawn;
pawn.pickup = inst;
inst.x = -32;
//inst.visible = false;
if (gameplay_object_have_tag(inst.src_map[? "id"],"clip")){
  inst.clip.x = x;
}
