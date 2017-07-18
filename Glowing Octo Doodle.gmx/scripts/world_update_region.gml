///world_update_region(x1, y1, x2, y2);
var cs = obj_floor.chunk_size;
for (var i=max(floor(argument0/cs/32)-1,0); i<min(ceil(argument2/cs/32)+1,obj_floor.width/cs); i+=1){
  for (var j=max(floor(argument1/cs/32)-1,0); j<min(ceil(argument3/cs/32)+1,obj_floor.height/cs); j+=1){
    world_floor_update_chunk(i, j);
    world_shadow_update_chunk(i, j);
  }; 
};

