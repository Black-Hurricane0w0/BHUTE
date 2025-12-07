/// @desc 使用一个物品
/// @param {real} item_pos 使用物品的物品槽
function Item_Use(item_pos){
	if ds_list_find_value(global._item_list,item_pos) {
		var item_inst = ds_list_find_value(global._item_list,item_pos);
		
		if instance_exists(item_inst) {
			with(item_inst){
				event_user(0);
			}
			Item_Delete(item_pos)
		}
	}
}