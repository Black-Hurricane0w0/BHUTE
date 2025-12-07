/// @desc 删除按键映射
/// @param {any} input 输入值
/// @returns {bool} 是否删除成功
function Input_Delete(input){
	if ds_map_exists(global._input_map,input){
		ds_map_delete(global._input_map,input);
        return true;
	}else{
		return false;
	}
}