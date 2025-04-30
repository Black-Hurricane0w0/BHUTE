//为ds地图提供参数
function File_Set(_key,_value){
	if ds_map_exists(global._save_map,_key) {
		ds_map_replace(global._save_map,_key,_value);//如果存在则设置
	} else {
		ds_map_add(global._save_map,_key,_value);//如果不存在则添加
	}
	return true;//返回为真
}