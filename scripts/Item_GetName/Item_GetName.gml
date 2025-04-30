function Item_GetName(item_pos){
	if ds_list_find_value(global._item_list,item_pos) != undefined or 0 {
		return ds_list_find_value(global._item_list,item_pos).name;
	}else{
		return "";
	}
	
}