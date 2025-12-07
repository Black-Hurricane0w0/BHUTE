/// @desc 获取物品的名称
/// @param {real} item_pos 物品槽位
function Item_GetName(item_pos){
	if ds_list_find_value(global._item_list,item_pos) != undefined or 0 {
		return ds_list_find_value(global._item_list,item_pos).name;
	}else{
		return "";
	}
	
}