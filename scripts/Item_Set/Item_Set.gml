/// @desc 设置物品槽内对应物品
/// @param {asset.gmobject} item_object 要设置的物品
/// @param {real} item_pos 设置的物品槽
function Item_Set(item_object,item_pos){
	if item_pos >= 0 and item_pos < 8 {
		if object_exists(item_object){
			var item_inst = instance_create_depth(0,0,0,item_object);
			ds_list_set(global._item_list,item_pos,item_inst);
		}
	}

}