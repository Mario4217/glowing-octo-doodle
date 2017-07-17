///world_floor_update_all()
for (var i=0; i<ceil(obj_floor.width)/obj_floor.chunk_size; i+=1){
  for (var j=0; j<ceil(obj_floor.height)/obj_floor.chunk_size; j+=1){
    world_floor_update_chunk(i, j);
    world_shadow_update_chunk(i, j);
  };
};
