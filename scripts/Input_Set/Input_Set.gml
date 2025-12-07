/// @desc 创建按键映射
/// @param {any} input 输入值
/// @param {any*} buttom 输入按钮
/// @returns {bool} 是否创建成功(必定成功)
function Input_Set(input,buttom){
	if ds_map_exists(global._input_map,input){
		ds_map_replace(global._input_map,input,buttom);
	}else{
		ds_map_add(global._input_map,input,buttom);
	}
	return true;
}