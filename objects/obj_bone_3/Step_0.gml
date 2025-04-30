// Inherit the parent event


time ++;

image_xscale = 1;
image_yscale = (bone_long + 12) / 40;
direction = facing * 90;
image_angle = facing * 90;
sprite_set_offset(spr_bone_0,6,40);
x += lengthdir_x(move_speed,direction);
y += lengthdir_y(move_speed,direction);

if place_meeting(x,y,obj_move_soul) and obj_move_soul.is_moved == false{
	Player_Damage(damage);
} 
if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}
if distance_to_object(obj_battle_arena) >= 1900 {
	instance_destroy();
}
