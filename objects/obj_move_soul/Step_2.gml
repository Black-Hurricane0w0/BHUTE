

//灵魂方向
if is_gravity == true {
	if dir == 270 {
		image_angle = 0;
		var jump_input = INPUT.UP;
		var bboxside = bbox_bottom;
	}
	if dir == 0 {
		image_angle = 90;
		var jump_input = INPUT.LEFT;
		var bboxside = bbox_right;
	} 
	if dir == 90 {
		image_angle = 180;
		var jump_input = INPUT.DOWN;
		var bboxside = bbox_top;
	} 
	if dir == 180 {
		image_angle = 270;
		var jump_input = INPUT.RIGHT;
		var bboxside = bbox_left;
	} 	
}

var point_up = -infinity;
var point_down = infinity;
var point_left = -infinity;
var point_right = infinity;







if obj_battle.battle_state == BATTLE_STATE.ENEMY {
		//跳跃逻辑
		if is_gravity == true {
			image_index = 1;
			//检查是否碰到平台
			if dir == 270 || dir == 90 {
				if position_meeting(x,bboxside + (dir == 90?-0.001:0),obj_platform) {
					var inst = instance_place(x,bboxside + (dir == 90?-0.001:0),obj_platform);
					var bboxdistance = abs(y - bboxside);
					if jump_state == 2  {
						onplatform = true;
						y = inst.bboxside + (dir == 270?-1:1) * bboxdistance;
						x += lengthdir_x(inst.move_speed,inst.dir);
						y += lengthdir_y(inst.move_speed,inst.dir);
						jump_state = 0;
						gmove = 0;
					}else if bboxside == inst.bboxside {
						onplatform = true
						y = inst.bboxside + (dir == 270?-1:1) * bboxdistance;
						x += lengthdir_x(inst.move_speed,inst.dir);
						y += lengthdir_y(inst.move_speed,inst.dir);
						jump_state = 0;
						gmove = 0;
					}
				}else{
					onplatform = false;
				}
			}
			if dir == 180 || dir == 0 {
				if position_meeting(bboxside + (dir == 180?-0.001:0),y,obj_platform) {
					var inst = instance_place(bboxside + (dir == 180?-0.001:0),y,obj_platform);
					var bboxdistance = abs(x - bboxside);
					if jump_state == 2  {
						onplatform = true;
						x = inst.bboxside + (dir == 0?-1:1) * bboxdistance;
						x += lengthdir_x(inst.move_speed,inst.dir);
						y += lengthdir_y(inst.move_speed,inst.dir);
						jump_state = 0;
						gmove = 0;
					}else if bboxside == inst.bboxside {
						onplatform = true;
						x = inst.bboxside + (dir == 0?-1:1) * abs(x-bboxside);
						x += lengthdir_x(inst.move_speed,inst.dir);
						y += lengthdir_y(inst.move_speed,inst.dir);
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
					y += gmove;
					break;
				}
				case 0 : {
					x += gmove;
					break;
				}
				case 90 : {
					y -= gmove;
					break;
				}
				case 180 : {
					x -= gmove;
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
						x -= move_speed * 0.5;
					}else {
						x -= move_speed;
					}
				}
				if Input_Check(INPUT.RIGHT,INPUT_STEAT.KEEP) {
					if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
						x += move_speed * 0.5;
					}else {
						x += move_speed;
					}
				}
			}
		if dir == 0 || dir == 180 {
				if Input_Check(INPUT.UP,INPUT_STEAT.KEEP) {
					if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
						y -= move_speed * 0.5;
					}else {
						y -= move_speed;
					}
				}
				if Input_Check(INPUT.DOWN,INPUT_STEAT.KEEP) {
					if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
						y += move_speed * 0.5;
					}else {
						y += move_speed;
					}
				}
			}
		}	
}
var leftnomove = false;
var rightnomove = false;
var upnomove = false;
var downnomove = false;
pos = new vec2(x,y);
{
	if x - sprite_width/2 <= point_left {
		var outside_distance = abs((x - sprite_width/2) - point_left);
		if x - sprite_width/2 < point_left {
			leftnomove = true;
		}
		x += outside_distance;
		if is_gravity == true and dir == 180 and jump_state != 0 {
			player_drop_event(180);
		}
		if is_gravity == true and dir == 0 and drop == false {
			gmove = 1;
			jump_state = 2;
		}
	}
	if x + sprite_width/2 >= point_right {
		var outside_distance = abs((x + sprite_width/2) - point_right);
		if x + sprite_width/2 > point_right {
			rightnomove = true;
		}
		x -= outside_distance;
		if is_gravity == true and dir == 0 and jump_state != 0 {
			player_drop_event(0);	
		}
		if is_gravity == true and dir == 180 and drop == false {
			gmove = 1;
			jump_state = 2;
		}
	}
	if y - sprite_height/2 <= point_up {
		var outside_distance = abs((y - sprite_height/2) - point_up);
		if y - sprite_height/2 < point_up {
			upnomove = true;
		}
		y += outside_distance;
		if is_gravity == true and dir == 90 and jump_state != 0 {
			player_drop_event(90);
		}
		if is_gravity == true and dir == 270 and drop == false {
			gmove = 1;
			jump_state = 2;
		}
	}
	if y + sprite_height/2 >= point_down {
		var outside_distance = abs((y + sprite_height/2) - point_down);
		if y + sprite_height/2 > point_down {
			downnomove = true;
		}
		y -= outside_distance;
		if is_gravity == true and dir == 270 and jump_state != 0 {
			player_drop_event(270);
		}
		if is_gravity == true and dir == 90 and drop == false {
			gmove = 1;
			jump_state = 2;
		}
	}
}



if x == xprevious and y == yprevious {
	is_moved = false;
}else {
	is_moved = true;
}
if downnomove || upnomove {
	is_moved = false;
	if leftnomove == false and rightnomove == false and x != xprevious {
		is_moved = true;
	}
}
if leftnomove || rightnomove {
	is_moved = false;
	if upnomove == false and downnomove == false and y != yprevious {
		is_moved = true;
	}
}

File_Set(PLAYER_INFO.X,obj_move_soul.x);
File_Set(PLAYER_INFO.Y,obj_move_soul.y);

if File_Get(PLAYER_INFO.HP) <= 0 || obj_battle.player_target_health <= 0 {
	room_goto(Room_BadEnd);
}