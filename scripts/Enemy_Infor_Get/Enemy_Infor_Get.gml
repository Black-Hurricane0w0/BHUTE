function Enemy_Infor_Get(key,enemy){
	if ds_map_find_value(global._enemy[enemy],key) != noone {
		var result = ds_map_find_value(global._enemy[enemy],key);
		return result;
	}
}