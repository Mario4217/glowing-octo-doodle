///world_resize(width, height)
for (var i=0; i<ceil(obj_floor.width/obj_floor.chunk_size); i+=1){
  for (var j=0; j<ceil(obj_floor.height/obj_floor.chunk_size); j+=1){
    if (surface_exists(obj_floor.chunk_floor[i, j])){
      surface_free(obj_floor.chunk_floor[i, j]);
    }
    if (surface_exists(obj_floor.chunk_shadow[i, j])){
      surface_free(obj_floor.chunk_shadow[i, j]);
    }
  };
};

for (var i=0; i<ceil(argument0 / obj_floor.chunk_size); i+=1){
  for (var j=0; j<ceil(argument1 / obj_floor.chunk_size); j+=1){
    obj_floor.chunk_floor[i, j] = -1;
    obj_floor.chunk_shadow[i, j] = -1;
    //world_floor_update_chunk(i, j);
  };
};

ds_grid_resize(obj_floor.grid, argument0, argument1);
obj_floor.width = argument0;
obj_floor.height = argument1;
