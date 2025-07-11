// Inherit the parent event
event_inherited();

if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}
//基础设置
time ++;
sprite_set_offset(spr_bone_0,6,40 * (1 -offest_point));
if mask == false {
    depth = DEPTH.BULLET_OUTSIDE;
}
image_yscale = (bone_long + 12) / 40;
image_angle = rot;
//每刻执行事件
if step_func != undefined {
	step_func();
}else {
	image_xscale = 1;
	visible = true;
	if time <= cost_time {
		var t = time / cost_time;
		if bone_max_long <= bone_default_long {
			bone_long = bone_max_long;
		}else {
			bone_long = animcurve_channel_evaluate(animcurve_get_channel(ac_bone_long,0),t) * (bone_max_long - bone_default_long) + bone_default_long;
		}
		rot = default_rot + angle_difference(target_rot,default_rot) * animcurve_channel_evaluate(animcurve_get_channel(ac_bone_rot,0),t);
	}else if time >= cost_time and time <= keep_time  {
		rot += rotspeed;
		bone_long = bone_max_long;
		x += lengthdir_x(move_speed,movedir);
		y += lengthdir_y(move_speed,movedir);
	}else if time >= keep_time {
		var t = (time - keep_time) / cost_time;
		bone_long = animcurve_channel_evaluate(animcurve_get_channel(ac_bone_long,0),1-t) * (bone_max_long - bone_default_long) + bone_default_long;
		rot = default_rot + angle_difference(target_rot,default_rot) * animcurve_channel_evaluate(animcurve_get_channel(ac_bone_rot,0),1-t);
		if t >= 1 {
			instance_destroy();
		}
    }
}
damage_func();





