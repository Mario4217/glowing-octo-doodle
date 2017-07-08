///move(speed, direction, object)

var spd = argument0;
var dir = argument1;
var obj = argument2;
    
var xtarg = player_pawn.x+lengthdir_x(spd,dir);
var ytarg = player_pawn.y+lengthdir_y(spd,dir);

if (place_free(xtarg,ytarg)) {
    obj.x = xtarg;
    obj.y = ytarg;
} else {
    var sweep_interval = 10;
    
    for (var angle = sweep_interval; angle <= 80; angle += sweep_interval) {
        for (var multiplier = -1; multiplier <= 1; multiplier += 2) {      
            var angle_to_check = dir+angle*multiplier;
            xtarg = obj.x+lengthdir_x(spd, angle_to_check);
            ytarg = obj.y+lengthdir_y(spd, angle_to_check);     
            if (place_free(xtarg,ytarg)) {
                obj.x = xtarg;
                obj.y = ytarg;  
                exit;       
            }   
        }
    }
}
