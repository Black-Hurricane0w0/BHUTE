function Input_Set(input,buttom){
	if ds_map_exists(global._input_map,input){
		ds_map_replace(global._input_map,input,buttom);
	
	
	
	}else{
		ds_map_add(global._input_map,input,buttom);
	
	
	}
	return true;
}