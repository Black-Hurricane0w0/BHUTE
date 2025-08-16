
Replay();
Key();
time ++;

if time == 160 {
	audio_play_sound(snd_gameover,0,false);
}

if time >= 240 {
	if not instance_exists(text_inst) {
		if text_turn == 0 {
			text_inst = CreateText(100,250,DEPTH.UI_BUTTOM,"不要丧失你的决心",c_white,fnt_mono);
			text_inst.can_destroy = true;
			text_inst.text_size = 2;
		}
		if text_turn == 1 {
			text_inst = CreateText(100,250,DEPTH.UI_BUTTOM,"再尝试一次吧",c_white,fnt_mono);
			text_inst.can_destroy = true;
			text_inst.text_size = 2;
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

