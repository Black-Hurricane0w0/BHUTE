dir = dir mod 360;
if dir != 0 and dir != 90 and dir != 180 and dir != 270{
    dir = 270;
}

//KR计算
var kr = clamp(File_Get(PLAYER_INFO.KR),0,40);
kr = clamp(kr,0,obj_battle.player_target_health-1);
File_Set(PLAYER_INFO.KR,kr);
if kr_time < 0 and kr > 0{
    if kr >= 40 {
        kr_time = 1;
    }else if kr >= 30 and kr <= 39 {
        kr_time = 2;
    }else if kr >= 20 and kr <= 29 {
        kr_time = 10;
    }else if kr >= 10 and kr <= 19 {
        kr_time = 30;
    }else if kr >= 1 and kr <= 9 {
        kr_time = 60;
    }
    obj_battle.player_target_health -= 1;
    File_Set(PLAYER_INFO.KR,kr-1);
}
kr_time--


image_alpha = is_active;
if !is_active exit;


if obj_battle.battle_state == BATTLE_STATE.ENEMY {
	if is_gravity == false {
		image_angle = 0;
		image_index = 0;
        var x_axis = 0;
        var y_axis = 0;
		if Input_Check(INPUT.UP,INPUT_STEAT.KEEP) {
			if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
				y_axis -= 0.5;
			}else {
				y_axis -= 1;
			}
		}
		if Input_Check(INPUT.DOWN,INPUT_STEAT.KEEP) {
			if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
				y_axis += 0.5;
			}else {
				y_axis += 1;
			}
		}
		if Input_Check(INPUT.LEFT,INPUT_STEAT.KEEP) {
			if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
				x_axis -= 0.5;
			}else {
				x_axis -= 1;
			}
		}
		if Input_Check(INPUT.RIGHT,INPUT_STEAT.KEEP) {
			if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
				x_axis += 0.5;
			}else {
				x_axis += 1;
			}
		} 
        pos = pos.add(new vec2(x_axis * move_speed,y_axis * move_speed));
		is_onground = false;
		onplatform = false;
	}
}


if invulnerable > 0 {
	invulnerable --;
	if invulnerable mod 5 == 0 and invulnerable > 1 {
		if image_alpha == 1 {
			image_alpha = 0;
		}else{
			image_alpha = 1;
		}
	}
}else {
	image_alpha = 1;
}





//灵魂方向
var bboxside = -1
if is_gravity == true {
	if dir == 270 {
		image_angle = 0;
		var jump_input = INPUT.UP; 
        var opp_jump_input = INPUT.DOWN; 
        bboxside = bbox_bottom;
	}
	if dir == 0 {
		image_angle = 90;
		var jump_input = INPUT.LEFT;
        var opp_jump_input = INPUT.RIGHT; 
		bboxside = bbox_right;
	} 
	if dir == 90 {
		image_angle = 180;
		var jump_input = INPUT.DOWN;
        var opp_jump_input = INPUT.UP; 
		bboxside = bbox_top;
	} 
	if dir == 180 {
		image_angle = 270;
		var jump_input = INPUT.RIGHT;
        var opp_jump_input = INPUT.LEFT; 
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
			if (Input_Check(jump_input,INPUT_STEAT.KEEP) - Input_Check(opp_jump_input,INPUT_STEAT.KEEP)) == 1 {
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
				if (Input_Check(jump_input,INPUT_STEAT.KEEP)- Input_Check(opp_jump_input,INPUT_STEAT.KEEP)) != 1 {
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
			if (onplatform == true || is_onground == true) and jump_state == 2 and drop == false {
				gmove = 0;
				jump_state = 0;
			}else if (!onplatform and !is_onground) and jump_state = 0 {
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

