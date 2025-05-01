

//灵魂方向
var bboxside = -1
if is_gravity == true {
	if dir == 270 {
		image_angle = 0;
		var jump_input = INPUT.UP; 
        bboxside = bbox_bottom;
	}
	if dir == 0 {
		image_angle = 90;
		var jump_input = INPUT.LEFT;
		bboxside = bbox_right;
	} 
	if dir == 90 {
		image_angle = 180;
		var jump_input = INPUT.DOWN;
		bboxside = bbox_top;
	} 
	if dir == 180 {
		image_angle = 270;
		var jump_input = INPUT.RIGHT;
		bboxside = bbox_left;
	} 	
}



if obj_battle.battle_state == BATTLE_STATE.ENEMY {
		//跳跃逻辑
		if is_gravity == true {
			image_index = 1;
			//检查是否碰到平台
			if dir == 270 || dir == 90 {
				if position_meeting(pos.x,bboxside + (dir == 90?-0.001:0),obj_platform) {
					var inst = instance_place(pos.x,bboxside + (dir == 90?-0.001:0),obj_platform);
					var bboxdistance = abs(pos.y - bboxside);
					if jump_state == 2  {
						onplatform = true;
						pos.y = inst.bboxside + (dir == 270?-1:1) * bboxdistance;
						pos.x += lengthdir_x(inst.move_speed,inst.dir);
						pos.y += lengthdir_y(inst.move_speed,inst.dir);
						jump_state = 0;
						gmove = 0;
					}else if bboxside == inst.bboxside {
						onplatform = true
						pos.y = inst.bboxside + (dir == 270?-1:1) * bboxdistance;
						pos.x += lengthdir_x(inst.move_speed,inst.dir);
						pos.y += lengthdir_y(inst.move_speed,inst.dir);
						jump_state = 0;
						gmove = 0;
					}
				}else{
					onplatform = false;
				}
			}
			if dir == 180 || dir == 0 {
				if position_meeting(bboxside + (dir == 180?-0.001:0),pos.y,obj_platform) {
					var inst = instance_place(bboxside + (dir == 180?-0.001:0),pos.y,obj_platform);
					var bboxdistance = abs(pos.x - bboxside);
					if jump_state == 2  {
						onplatform = true;
						pos.x = inst.bboxside + (dir == 0?-1:1) * bboxdistance;
						pos.x += lengthdir_x(inst.move_speed,inst.dir);
						pos.y += lengthdir_y(inst.move_speed,inst.dir);
						jump_state = 0;
						gmove = 0;
					}else if bboxside == inst.bboxside {
						onplatform = true;
						pos.x = inst.bboxside + (dir == 0?-1:1) * abs(x-bboxside);
						pos.x += lengthdir_x(inst.move_speed,inst.dir);
						pos.y += lengthdir_y(inst.move_speed,inst.dir);
						jump_state = 0;
						gmove = 0;
					}
				}else{
					onplatform = false;
				}
			}
			if Input_Check(jump_input,INPUT_STEAT.KEEP) {
				if gmove < 0 {
					gmove += gravity_jump;
				}
				if jump_state == 0 {
					air_time = 7;
					gmove = -jump_speed;
					jump_state = 1;
				}
			}
			if jump_state == 1 {
				if Input_Check(jump_input,INPUT_STEAT.RELEASED) {
					jump_state = 2;
				}
				if gmove >= 0 {
					jump_state = 2;
					air_time = 0;
				}
			}
			if jump_state == 2 {
				if air_time > 0 {
					air_time --;
					gmove = 0;
				}else {
					gmove += gravity_fall;
					if gmove > max_speed {
						gmove = max_speed;
					}
				}
			}
			if (onplatform == true || is_onground == true) and jump_state = 2 and drop == false {
				gmove = 0;
				jump_state = 0;
			}else if (!onplatform || !is_onground) and jump_state = 0 {
				jump_state = 2;
			}
			switch (dir) {
				case 270 : {
					pos.y += gmove;
					break;
				}
				case 0 : {
					pos.x += gmove;
					break;
				}
				case 90 : {
					pos.y -= gmove;
					break;
				}
				case 180 : {
					pos.x -= gmove;
					break;
				}
			}

		is_onground = false;
        /// @param {real} _dir 
		var player_drop_event = function(_dir) {
			if drop == false {
				jump_state = 0;
				gmove = 1;
				is_onground = true;
			}
			if drop == true and dir == _dir  {
				jump_state = 0;
				gmove = 1;
				is_onground = true;
				drop = false;
				audio_play_sound(snd_impact,0,false)
				Shook_Set(0.45);
			}
		}	
		//横向移动
		if dir == 270 || dir == 90 {
				if Input_Check(INPUT.LEFT,INPUT_STEAT.KEEP) {
					if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
						pos.x -= move_speed * 0.5;
					}else {
						pos.x -= move_speed;
					}
				}
				if Input_Check(INPUT.RIGHT,INPUT_STEAT.KEEP) {
					if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
						pos.x += move_speed * 0.5;
					}else {
						pos.x += move_speed;
					}
				}
			}
		if dir == 0 || dir == 180 {
				if Input_Check(INPUT.UP,INPUT_STEAT.KEEP) {
					if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
						pos.y -= move_speed * 0.5;
					}else {
						pos.y -= move_speed;
					}
				}
				if Input_Check(INPUT.DOWN,INPUT_STEAT.KEEP) {
					if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
						pos.y += move_speed * 0.5;
					}else {
						pos.y += move_speed;
					}
				}
			}
		}	
}

//是否移动？
if Input_Check(INPUT.LEFT,INPUT_STEAT.KEEP) || Input_Check(INPUT.RIGHT,INPUT_STEAT.KEEP) || Input_Check(INPUT.UP,INPUT_STEAT.KEEP) || Input_Check(INPUT.DOWN,INPUT_STEAT.KEEP) {
	is_moved = true;
}else {
	is_moved = false;
}

//同步xy
File_Set(PLAYER_INFO.X,obj_move_soul.x);
File_Set(PLAYER_INFO.Y,obj_move_soul.y);

//死亡检测
if File_Get(PLAYER_INFO.HP) <= 0 || obj_battle.player_target_health <= 0 {
	room_goto(Room_BadEnd);
}

//应用改变坐标
x = pos.x;
y = pos.y;