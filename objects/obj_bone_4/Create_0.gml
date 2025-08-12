// Inherit the parent event
event_inherited();
damage = Enemy_Infor_Get("id",0).attack_damage;
movedir = 0;
rot = 0;
rotspeed = 0;
move_speed = 0;
bone_long = 10;
color = c_white;
ac_bone_long = ac_bone_default;
ac_bone_rot = ac_bone_default;
default_rot = 0;
bone_default_long = 0;
target_rot = 0
bone_max_long = 10;
cost_time = 0;
visible = false;
mask = false;
keep_time = 0;
time = 0;
offest_point = 0.5;
alpha = 1;
pos = new vec2();
tag = "";


step_func = undefined;
damage_func = function(self){
    //伤害判定
    for (var i=0;i<=1;i+=0.1) {
        var xx = lerp(x,xprevious,i);
        var yy = lerp(y,yprevious,i);
        if place_meeting(xx,yy,obj_move_soul){
            if color == c_orange and obj_move_soul.is_moved == false {
                Player_Damage(damage,1);
            }else if color == c_blue and obj_move_soul.is_moved == true {
                Player_Damage(damage,1);
            }else if color == c_white {
                Player_Damage(damage,1);
            }
        } 
    }    
};

rot = default_rot;
