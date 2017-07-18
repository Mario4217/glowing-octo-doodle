///gp_pickup(instance, pawn)
var inst = argument0;
var pawn = argument1;

if (pawn.pickup != -1){
  //something went wrong!
}

pawn.pickup = inst;
inst.x = -32;
inst.visible = false;
if (gameplay_object_have_tag(inst.src_map[? "id"],"clip")){
  inst.clip.x = x;
}
