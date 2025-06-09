// Inherit the parent event
event_inherited();
damage = Enemy_Infor_Get("id").attack_damage;
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
pos = new vec2();
tag = "";

draw_bone = function() {
    //绘制
        var _color = color
        if color == c_blue {
    		_color = make_color_rgb(0,125,255);
    	} 
    	var start_x = pos.x - lengthdir_x((bone_long + 12) * offest_point,rot + 90);
    	var start_y = pos.y - lengthdir_y((bone_long + 12) * offest_point,rot + 90);
    	draw_sprite_ext(spr_bottom_bone,0,start_x,start_y,1,1,rot,_color,1);
    	var xx = start_x;
    	var yy = start_y;
    	for (i = 0;i < bone_long;i++){
    		xx += lengthdir_x(6 + i,rot + 90);
    		yy += lengthdir_y(6 + i,rot + 90);
    		draw_sprite_ext(spr_bone_pixel,0,xx,yy,1,1,rot,_color,1);
    		xx = start_x;
    		yy = start_y;
    	}
    	xx += lengthdir_x(6 + bone_long,rot + 90);
    	yy += lengthdir_y(6 + bone_long,rot + 90);
    	draw_sprite_ext(spr_top_bone,0,xx,yy,1,1,rot,_color,1);
}


draw_function = function(){
    draw_bone();
}
step_func = undefined;
damage_func = function(){
    //伤害判定
    for (i=0;i<=1;i+=0.1) {
        var xx = lerp(pos.x,xprevious,i);
        var yy = lerp(pos.y,yprevious,i);
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
