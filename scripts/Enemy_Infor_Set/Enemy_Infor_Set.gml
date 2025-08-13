function Enemy_Infor_Set(key,value,enemy){
    if array_length(global._enemy) < enemy + 1 {
        global._enemy[enemy] = ds_map_create();
    }
	if ds_map_exists(global._enemy[enemy],key){
		ds_map_replace(global._enemy[enemy],key,value);
	}else{
		ds_map_add(global._enemy[enemy],key,value);
	}
	return true;
}