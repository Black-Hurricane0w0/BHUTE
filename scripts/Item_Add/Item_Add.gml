function Item_Add(item_object){
	if object_exists(item_object){
		Item_Set(item_object,Item_Number());
	}
}