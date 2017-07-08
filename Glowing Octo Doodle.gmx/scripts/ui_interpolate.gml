///ui_interpolate(ease,val,target,factor)
if argument0 == 0{
 if abs(argument1-argument2) < argument3{return argument2}
 return argument1 + sign(argument2-argument1)*argument3
}
if argument0 == 1{
 return argument1 - (argument1-argument2)*argument3
}
