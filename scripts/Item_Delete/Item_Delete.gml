/// @desc 在玩家Item栏里删除一个物品
/// @param {real} item_pos 物品槽位
function Item_Delete(item_pos){
	if ds_list_find_value(global._item_list,item_pos) {
		var item_inst = ds_list_find_value(global._item_list,item_pos);
		
		ds_list_delete(global._item_list,item_pos);
		if instance_exists(item_inst) {
			instance_destroy(item_inst);
		}
	}
}