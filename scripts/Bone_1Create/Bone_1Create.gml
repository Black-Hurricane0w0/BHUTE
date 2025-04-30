function Bone_1Create(_x,_y,facing = 0,move_speed = 1,long = 10,maxlong = 10,longspeed = 1,keep_time = 10,tag = ""){
	inst = instance_create_depth(0,0,0,obj_bone_1){
		inst.facing = facing;
		inst.move_speed = move_speed;
		inst.x = _x;
		inst.y = _y;
		inst.bone_long = long;
		inst.bone_max_long = maxlong;
		inst.bone_long_speed = longspeed;
		inst.keep_time = keep_time;
		inst.tag = tag;
	}
	return inst;
}