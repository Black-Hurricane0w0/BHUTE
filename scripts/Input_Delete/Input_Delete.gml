/**
 * @function Input_Delete
 * @description 删除指定的按键映射
 * @param {any} input 输入值（使用INPUT中的常量）
 * @returns {boolean} 是否删除成功
 * 如果该输入值存在，则删除其映射并返回true
 * 如果该输入值不存在，则返回false
 */
function Input_Delete(input){
	if ds_map_exists(global._input_map,input){
		ds_map_delete(global._input_map,input);
        return true;
	}else{
		return false;
	}
}