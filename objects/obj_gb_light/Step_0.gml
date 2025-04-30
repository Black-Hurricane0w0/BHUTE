if place_meeting(x,y,obj_move_soul) and image_alpha >= 0.2 {
	Player_Damage(damage);
}
if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}

image_yscale = 1 * size;
image_angle = facing + 90;
image_speed = 0;
time ++;

var ac_point = time / keep_time;
image_xscale = animcurve_channel_evaluate(animcurve_get_channel(ac_gb,0),ac_point) * flat_count * size;
image_alpha = animcurve_channel_evaluate(animcurve_get_channel(ac_gb_alpha,0),ac_point);
if ac_point >= 1 {
	instance_destroy();
}
//已废弃
{
//if state == 0 and time >= 1 {	
//	if time >= 30 {
//		image_xscale = size * (1/8 * sin(time / 10 + 4.85) + 0.9) * flat_count;
//	}else {
//		image_xscale = time * 1/30 * size * flat_count;
//		image_alpha = time * 1/30;
//	}
//}else if state == 1  {
//	var reduce_speed = image_xscale / 4 * flat_count;
//	image_xscale -= reduce_speed * flat_count;
//	image_alpha -= 1 / sum;
//	if image_xscale <= 0.01 {
//		instance_destroy();
//	}
//}
}