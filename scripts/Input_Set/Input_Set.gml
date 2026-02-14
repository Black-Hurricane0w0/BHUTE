/**
 * @function Input_Set
 * @description 创建或修改按键映射，将输入值与实际的按钮关联起来
 * @param {any} input 输入值（使用INPUT中的常量）
 * @param {any} buttom 输入按钮（可以是键盘按键码或游戏手柄按钮码）
 * @returns {boolean} 是否创建成功（必定成功）
 * 如果该输入值已经存在，则替换原有的按钮映射
 * 如果该输入值不存在，则添加新的按钮映射
 * 该函数总是返回true，表示创建成功
 */
function Input_Set(input,buttom){
	if ds_map_exists(global._input_map,input){
		ds_map_replace(global._input_map,input,buttom);
	}else{
		ds_map_add(global._input_map,input,buttom);
	}
	return true;
}