///event_trigger(eventid)
if (is_server){
  for (i=0; i<ds_list_size(outputs); i+=1){
    var map = outputs[| i];
    if (map[? "event"]) == argument0{
      map[? "target"].input = map;
      with (map[? "target"]){
        event_perform(ev_other, ev_user0);
      }
      if (is_network){
        buffer_seek(nw_buffer, buffer_seek_start, 0);
        buffer_write(nw_buffer, buffer_u8, NW.ent_action);
        buffer_write(nw_buffer, buffer_u16, map[? "target"].index);
        buffer_write(nw_buffer, buffer_u16, map[? "action"]);
        nw_broadcast(nw_buffer);
      }
    }
  };
}
