function BoneOrangeCreate(_x,_y,facing = 0,move_speed = 1,long = 10,tag = ""){
	var inst = instance_create_depth(0,0,0,obj_bone_3){
		inst.facing = facing;
		inst.move_speed = move_speed;
		inst.x = _x;
		inst.y = _y;
		inst.bone_long = long;
		inst.tag = tag;
	}
	return inst;
}