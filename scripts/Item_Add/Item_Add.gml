/// @desc 在玩家Item栏里新增一个物品
/// @param {asset.gmobject} item_object 新增加的物品
function Item_Add(item_object){
	if object_exists(item_object){
		Item_Set(item_object,Item_Number());
	}
}