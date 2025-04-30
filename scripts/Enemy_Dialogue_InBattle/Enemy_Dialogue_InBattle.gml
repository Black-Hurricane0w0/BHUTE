function Enemy_Dialogue_InBattle(text,maxtime){
	inst = instance_create_depth(420,90,DEPTH.ENEMY,obj_dialogue_inbattle){
		inst.text = text;
		inst.maxtime = maxtime;
	}
}