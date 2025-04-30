if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}
time ++
time = floor(time);
image_xscale = flat_count * size * 2;
image_yscale = size * 2;
mask_index = spr_gb;
if time == 1 and ready_time = true {
	if not (audio_is_playing(snd_gb_prepare2) && audio_sound_get_track_position(global.music) = 0) {
		global.music = audio_play_sound(snd_gb_prepare2,0,false);
	}
	target_x = x;
	target_y = y;
	visible = true;
	image_angle = facing + 90 + start_facing;
}

if time <= 27 and time >= 1 and ready_time = true  {
    var dis = (200 - animcurve_channel_evaluate(animcurve_get_channel(ac_gb_prepare,0),time / 27)) * 1.5 * size;
	var xx = lengthdir_x(dis,facing + 1.5 * start_facing);
	var yy = lengthdir_y(dis,facing + 1.5 * start_facing);
	x = target_x + xx;
	y = target_y + yy;
	if start_facing == 90 {
		var dir = 90 * (1 - animcurve_channel_evaluate(animcurve_get_channel(ac_gb_prepare,0),time / 27)/200);
	}else if start_facing == -90 {
		var dir = -90 * (1 - animcurve_channel_evaluate(animcurve_get_channel(ac_gb_prepare,0),time / 27)/200);
	}
	image_angle = facing + 90 + dir;
	
	
}
if time == 27 {
	x = target_x;
	y = target_y;
	image_angle = facing + 90;
}

if time == 27 + fire_time {
	//发射
	if not (audio_is_playing(snd_gb_fire2) && audio_sound_get_track_position(global.music) = 0) {
		global.music = audio_play_sound(snd_gb_fire2,0,false);
	}
	gb_light = GB_Light2Create(x,y,facing,1.6 * size,keep_time,flat_count,ac_gb);
	back_speed = 0;
	gb_light.state = 0;
	image_speed = 1;
	Shook_Set(1 * size);
}
if time >= 27 + fire_time {
	if image_index == 5 {
		image_speed = 1;
	}else if image_index == 6 {
		image_speed = -1;
	}
	//后座
	var t = (time - 27 - fire_time) / 60;
	if point_distance(x,y,obj_battle.x,obj_battle.y) < 1000 {
		back_dis = animcurve_channel_evaluate(animcurve_get_channel(ac_gb_left,0),t);
		if t >= 1 {
			back_dis += 20;
		}
	}else {
		back_dis = 1000;
	}
	
	var _back_dis = back_dis * size * 2;
	var _target_x = target_x;
	var _target_y = target_y;
	x = target_x + lengthdir_x(_back_dis,facing + 180);
	y = target_y + lengthdir_y(_back_dis,facing + 180);
	with (gb_light) {
		x = _target_x + lengthdir_x(_back_dis,facing + 180);
		y = _target_y + lengthdir_y(_back_dis,facing + 180);
	}
	if time >= 27 + fire_time + keep_time {
		instance_destroy();
	}
}