// Inherit the parent event
if place_meeting(x,y,obj_move_soul) and obj_move_soul.is_moved == true{
	Player_Damage(damage);
} 
if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}
if x <= -global.buttle_range || x >= room_width + global.buttle_range || y < -global.buttle_range || y >= room_height + global.buttle_range {
	instance_destroy();
}

time ++;
sprite_set_offset(spr_bone_0,6,40);
image_xscale = 1;
image_yscale = (bone_long + 12) / 40;
direction = facing * 90;
image_angle = facing * 90;

x += lengthdir_x(move_speed,direction);
y += lengthdir_y(move_speed,direction);

event_inherited();
