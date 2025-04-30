function GB_LightCreate(_x,_y,facing = 0,size = 1,keep_time = 60,flat_count = 1,ac_gb = ac_gb_default){
	inst = instance_create_depth(0,0,0,obj_gb_light){
		inst.facing = facing;
		inst.size = size;
		inst.x = _x;
		inst.y = _y;
		inst.keep_time = keep_time;
		inst.flat_count = flat_count;
		inst.ac_gb = ac_gb;
	}
	return inst;
}