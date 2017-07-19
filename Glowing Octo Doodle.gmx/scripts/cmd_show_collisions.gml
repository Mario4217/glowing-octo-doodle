///cmd_show_collisions(args)
var val = real(argument0[1]);
if (val == 0 || val == 1){
  with (obj_clip){
    visible = val;
  }
}

