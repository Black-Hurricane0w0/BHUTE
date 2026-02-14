
Replay();
time ++;

if time == 160 {
	audio_play_sound(snd_gameover,0,false);
}

if time >= 240 {
	if not instance_exists(text_inst) {
		if text_turn == 0 {
            text_inst = CreateLangText(200,250,DEPTH.UI_TOP,GetTranslationDetailed("ui.badend_dialogue_1"),c_white)
			text_inst.can_destroy = true;
			text_inst.text_size = 2;
            text_inst.text_speed = 10;
		}
		if text_turn == 1 {
            var text = GetTranslationDetailed("ui.badend_dialogue_2");
			text_inst = CreateText(200,250,DEPTH.UI_TOP,File_Get(PLAYER_INFO.NAME)+"&"+text.text,c_white,text.font);
			text_inst.can_destroy = true;
			text_inst.text_size = 2;
            text_inst.text_speed = 10;
		}
		if text_turn >= 2 {
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

