///nw_income_client(buffer);
switch (buffer_read(argument0, buffer_u8)){
  case NW.server_welcome:
    var version = buffer_read(argument0, buffer_string);
    if (version != GM_version){
      console_print("Server is using version "+string(version)+" and you are using "+string(GM_version)+"!",c_red);
      //nw_end();
      //return false;
    }
    nw_own_id = buffer_read(argument0, buffer_u8);
    console_print("Server is using version "+string(version));
    nw_send_profile();
  break;
  case NW.client_connect:
    var pl = nw_make_player(0);
    pl[? "id"] = buffer_read(argument0, buffer_u8);
    pl[? "name"] = buffer_read(argument0, buffer_string);
    pl[? "red"] = buffer_read(argument0, buffer_u8);
    pl[? "green"] = buffer_read(argument0, buffer_u8);
    pl[? "blue"] = buffer_read(argument0, buffer_u8);
    
    pl[? "pawn"].secondary_color = make_color_rgb(pl[? "red"], pl[? "green"], pl[? "blue"]);
    nw_players[? pl[? "id"]] = pl;
    
  break;
  case NW.client_profile:
    var player = nw_players[? buffer_read(argument0, buffer_u8)];
    player[? "red"] = buffer_read(argument0, buffer_u8);
    player[? "green"] = buffer_read(argument0, buffer_u8);
    player[? "blue"] = buffer_read(argument0, buffer_u8);
    player[? "name"] = buffer_read(argument0, buffer_string);
    player[? "pawn"].secondary_color = make_color_rgb(player[? "red"], player[? "green"], player[? "blue"]);
  break;
  case NW.position:
    var player = nw_players[? buffer_read(argument0, buffer_u8)];
    var pawn = player[? "pawn"];
    pawn.x = buffer_read(argument0, buffer_u16);
    pawn.y = buffer_read(argument0, buffer_u16);
  break;
  case NW.map_data:
    world_from_buffer(argument0);
  break;
  case NW.ent_action:
    var target = buffer_read(argument0, buffer_u16);
    var action = buffer_read(argument0, buffer_u16);
    var link = ds_map_create();
    link[? "action"] = action;
    target = obj_world.inst_by_index[? target];
    if (target != undefined){
      if (instance_exists(target)){
        target.input = link;
        with (target){
          event_perform(ev_other, ev_user0);
        }
      }
    }
    ds_map_destroy(link);
  break;
  case NW.ent_position:
    var index = buffer_read(argument0, buffer_u16);
    var inst = obj_world.inst_by_index[? index];
    if (inst != undefined){
      if (instance_exists(inst)){
        inst.x = buffer_read(argument0, buffer_u16);
        inst.y = buffer_read(argument0, buffer_u16);        
      }
    }
  break;
  case NW.pawn_pickup:
    var player = nw_players[? buffer_read(argument0, buffer_u8)];
    var pawn = player[? "pawn"];
    var pickup_inst = obj_world.inst_by_index[? buffer_read(argument0, buffer_u16)];
    if (pickup_inst != undefined){
      pawn.pickup = pickup_inst;
    }else{
      pawn.pickup = -1;
    }
  break;
}
