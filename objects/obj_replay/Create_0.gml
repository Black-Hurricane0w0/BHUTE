
//删除系统
ds_map_destroy(global._input_map);
ds_map_destroy(global._save_map);
ds_queue_destroy(global._battle_dialogue);
ds_queue_destroy(global._enemy_dialogue);
ds_list_destroy(global._item_list);


Init();

room_goto(Room_Battle);	