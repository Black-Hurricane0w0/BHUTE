if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}
if distance_to_object(obj_battle_arena) >= 900 {
	instance_destroy();
}




x += lengthdir_x(move_speed,dir);
y += lengthdir_y(move_speed,dir);


if dir == 0 {
	bboxside = bbox_top;
}
if dir == 90 {
	bboxside = bbox_left;
} 
if dir == 180 {
	bboxside = bbox_bottom;
} 
if dir == 270 {
	bboxside = bbox_right;
}