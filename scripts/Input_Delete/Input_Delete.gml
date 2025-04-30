function Input_Delete(input){
	if ds_map_exists(global._input_map,input){
		ds_map_delete(global._input_map,input)
	}else{
		return false;
	}
}