// Inherit the parent event
if place_meeting(x,y,obj_move_soul) and obj_move_soul.is_moved == true{
	Player_Damage(damage);
    if !place_meeting(xprevious,yprevious,obj_move_soul){
        Player_Kr(5);
    }else{
        Player_Kr(1);
    }
} 
if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}
if x <= -global.buttle_range || x >= room_width + global.buttle_range || y < -global.buttle_range || y >= room_height + global.buttle_range {
	instance_destroy();
}


if bone_long < bone_max_long and keep_time > 0 {
	bone_long += bone_long_speed;
}
if bone_long >= bone_max_long and keep_time > 0 {
	bone_long = bone_max_long;
	keep_time --;
}
if keep_time <= 0 {
	bone_long -= bone_long_speed;
	if bone_long <= 0 {
		instance_destroy();
	}
}



image_xscale = 1;
image_yscale = (bone_long + 12) / 40;
direction = facing * 90;
image_angle = facing * 90;
sprite_set_offset(spr_bone_0,6,40);


x += lengthdir_x(move_speed,direction);
y += lengthdir_y(move_speed,direction);


event_inherited();

