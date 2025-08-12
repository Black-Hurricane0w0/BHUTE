function Enemy_Infor_Set(key,value){
    var enemy = instance_number(obj_basic_enemy);
    if array_length(global._enemy) < enemy {
        global._enemy[enemy-1] = ds_map_create();
    }
	if ds_map_exists(global._enemy[enemy-1],key){
		ds_map_replace(global._enemy[enemy-1],key,value);
	}else{
		ds_map_add(global._enemy[enemy-1],key,value);
	}
	return true;
}