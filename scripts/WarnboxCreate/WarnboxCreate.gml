function WarnboxCreate(posx1,posy1,posx2,posy2,keep_time,tag = ""){
	inst = instance_create_depth(0,0,0,obj_warnbox){
		inst.keep_time = keep_time;
		inst.pos_1 = {
			posx : posx1,
			posy : posy1
		}
		inst.pos_2 = {
			posx : posx2,
			posy : posy2
		}
		inst.tag = tag;
	}
	return inst;
}