function Replay(){
    if gamepad_is_connected(0) == true {
        if gamepad_button_check_pressed(0,gp_face4){
            ds_queue_clear(global._enemy_dialogue);
    		ds_list_clear(global._item_list);
    		ds_queue_clear(global._battle_dialogue);
    		part_system_destroy(global._part_system);
    		part_type_destroy(global._part_type);
    		audio_stop_all();
    		room_goto(Room_Replay);
        }
    }else{
        if keyboard_check_pressed(vk_f2) {
    		ds_queue_clear(global._enemy_dialogue);
    		ds_list_clear(global._item_list);
    		ds_queue_clear(global._battle_dialogue);
    		part_system_destroy(global._part_system);
    		part_type_destroy(global._part_type);
    		audio_stop_all();
    		room_goto(Room_Replay);
    	}
    }

}