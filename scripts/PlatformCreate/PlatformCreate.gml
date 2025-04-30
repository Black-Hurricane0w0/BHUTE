function PlatformCreate(_x,_y,facing = 0,move_speed = 1,xsize = 1,ysize = 1,ismask = true,tag = ""){
	inst = instance_create_depth(0,0,0,obj_platform){
		inst.dir = facing;
		inst.move_speed = move_speed;
		inst.x = _x;
		inst.y = _y;
		inst.xsize = xsize;
		inst.ysize = ysize;
		inst.mask = ismask;
		inst.tag = tag;
	}
	with (inst) {
		event_user(0);
	}
	return inst;
}