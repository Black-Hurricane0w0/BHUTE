
function Player_SetSoul(is_grav,dir,is_effect){
	var state_before = obj_move_soul.is_gravity;//0红1蓝
	
	if is_grav == true {
		obj_move_soul.is_gravity = true;
		obj_move_soul.dir = dir;
		global.soul_color = c_blue;
	}else if is_grav == false {
		obj_move_soul.is_gravity = false;
		global.soul_color = c_red;
	}
	if is_grav != state_before and is_effect == true {
		instance_create_depth(obj_move_soul.x,obj_move_soul.y,DEPTH.SOUL,obj_soul_image);
	}
	obj_move_soul.vspeed = 0;
	obj_move_soul.hspeed = 0;
	obj_move_soul.jump_state = 2;
	obj_move_soul.keep_up_time = 0;
	obj_move_soul.onplatform = false;
}