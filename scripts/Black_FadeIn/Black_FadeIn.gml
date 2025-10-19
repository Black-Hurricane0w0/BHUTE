function Black_FadeIn(posx,posy,size,time){
	inst = instance_create_depth(posx,posy,-999,obj_black_fadein,{ 
        maxtime : time
    }){
        inst.size = size;
	}	
	return inst;
}