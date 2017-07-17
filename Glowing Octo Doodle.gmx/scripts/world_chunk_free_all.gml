///world_floor_free_all()
for (var i=0; i<ceil(obj_floor.width)/obj_floor.chunk_size; i+=1){
  for (var j=0; j<ceil(obj_floor.height)/obj_floor.chunk_size; j+=1){
    if (surface_exists(obj_floor.chunk_floor[i, j])){
      surface_free(obj_floor.chunk_floor[i, j]);
      chunk_floor[i, j] = -1;
    }
    if (surface_exists(obj_floor.chunk_shadow[i, j])){
      surface_free(obj_floor.chunk_shadow[i, j])
      chunk_shadow[i, j] = -1;
    }
  };
};
