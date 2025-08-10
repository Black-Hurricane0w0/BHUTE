char_x = 0;
char_y = 0;

for (var i=0;i < ds_list_size(char_list);i++){
	if instance_exists(ds_list_find_value(char_list,i)){
		instance_destroy(ds_list_find_value(char_list,i));
	}
}

ds_list_destroy(char_list);