///event_trigger(eventid)
if (is_server){
  for (i=0; i<ds_list_size(outputs); i+=1){
    var map = outputs[| i];
    if (map[? "event"]) == argument0{
      map[? "target"].input = map;
      with (map[? "target"]){
        event_perform(ev_other, ev_user0);
      }
    }
  };
}
