function GB2Create(_x,_y,facing = 0,size = 1,keep_time = 60,fire_time = 60,start_facing = 1,ready = true,flat_count = 1,wait_time = 0,ac_gb = ac_gb_default,glowing = true){
	var inst = instance_create_depth(0,0,0,obj_gb2){
		inst.facing = facing;
		inst.size = size;
		inst.x = _x;
		inst.y = _y;
		inst.keep_time = keep_time;
		inst.fire_time = fire_time;
		inst.start_facing = start_facing * 90;
		inst.ready_time = ready;
		inst.flat_count = flat_count;
		inst.time = -wait_time;
		inst.ac_gb = ac_gb;
        inst.glowing = glowing;
	}
	return inst;
}