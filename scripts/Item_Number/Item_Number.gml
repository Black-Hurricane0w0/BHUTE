/// @desc 获取物品数量
/// @returns {real} 物品数量
function Item_Number(){
	return ds_list_size(global._item_list);
}