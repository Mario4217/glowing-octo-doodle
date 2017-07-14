///move(speed, direction, object)

var spd = argument0;
var dir = argument1;
var obj = argument2;
    
var xtarg = obj.x+lengthdir_x(spd,dir);
var ytarg = obj.y+lengthdir_y(spd,dir);

if (!collision_point(xtarg,ytarg, obj_clip, 0, 0)) {
    obj.x = xtarg;
    obj.y = ytarg;
} else {
    var sweep_interval = 10;
    
    for (var angle = sweep_interval; angle <= 80; angle += sweep_interval) {
        for (var multiplier = -1; multiplier <= 1; multiplier += 2) {      
            var angle_to_check = dir+angle*multiplier;
            xtarg = obj.x+lengthdir_x(spd, angle_to_check);
            ytarg = obj.y+lengthdir_y(spd, angle_to_check);     
            if (!collision_point(xtarg,ytarg, obj_clip, 0, 0)){
                obj.x = xtarg;
                obj.y = ytarg;  
                exit;
            }   
        }
    }
}
