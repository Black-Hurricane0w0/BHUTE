function File_Get(_key){
	if ds_map_find_value(global._save_map,_key) != noone {
		return ds_map_find_value(global._save_map,_key);
	}
}