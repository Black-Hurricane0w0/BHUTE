function Enemy_Infor_Get(key){
	if ds_map_find_value(global._enemy,key) != noone {
		var result = ds_map_find_value(global._enemy,key);
		return result;
	}
}