function Won(){
		ds_queue_clear(global._enemy_dialogue);
		ds_list_clear(global._item_list);
		ds_queue_clear(global._battle_dialogue);
		part_system_destroy(global._part_system);
		part_type_destroy(global._part_type);
		audio_stop_all();
		room_goto(Room_Init);
}