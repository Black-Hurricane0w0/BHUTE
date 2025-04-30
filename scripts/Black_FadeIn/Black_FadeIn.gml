function Black_FadeIn(posx,posy,size,alpha_speed){
	inst = instance_create_depth(posx,posy,-999,obj_black_fadein){
		inst.alpha_speed = alpha_speed;
		inst.size = size;
	}	
	return inst;
}