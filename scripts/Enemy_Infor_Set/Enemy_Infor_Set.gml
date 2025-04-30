function Enemy_Infor_Set(key,value){
	if ds_map_exists(global._enemy,key){
		ds_map_replace(global._enemy,key,value);
	}else{
		ds_map_add(global._enemy,key,value);
	}
	return true;
}