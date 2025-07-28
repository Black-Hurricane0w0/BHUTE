
function Player_SetSoul(is_grav,dir,is_effect){
	var state_before = obj_move_soul.is_gravity;
    var dir_before = obj_move_soul.dir;
	
	if is_grav == true {
		obj_move_soul.is_gravity = true;
		obj_move_soul.dir = dir mod 360;
		global.soul_color = SOUL_STATE.BLUE;
	}else if is_grav == false {
		obj_move_soul.is_gravity = false;
		global.soul_color = SOUL_STATE.RED;
	}
	if (is_grav != state_before || dir != dir_before) and is_effect == true {
		instance_create_depth(obj_move_soul.pos.x,obj_move_soul.pos.y,DEPTH.SOUL,obj_soul_image);
	}
	obj_move_soul.vspeed = 0;
	obj_move_soul.hspeed = 0;
	obj_move_soul.jump_state = 2;
	obj_move_soul.keep_up_time = 0;
	obj_move_soul.onplatform = false;
}