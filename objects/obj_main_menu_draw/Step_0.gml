time ++ ;
if time == 220 {
	audio_play_sound(snd_logo,false,false);
}
if time >= 220  {
	if goto_setting == false && goto_battle == false {
		//确认
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED){
			switch (menu_choice) {
				case 0 : {
					audio_play_sound(snd_buttom_select,false,false);
					inst = Black_FadeOut(320,240,10,0.05);
					goto_battle = true;
					break;
				}
				case 1 : {
					audio_play_sound(snd_buttom_select,false,false);
					inst = Black_FadeOut(320,240,10,0.01);
					goto_setting = true;
					break;
				}
			}
		}
		//选择
		if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED) {//上
			menu_choice --;
			if menu_choice < 0 {
				menu_choice = 1;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}
		if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) {//下
			menu_choice ++;
			if menu_choice > 1 {
				menu_choice = 0;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}
		//没有灵魂创建灵魂
		if not instance_exists(obj_soul) {
			instance_create_depth(-20,292+12,DEPTH.SOUL,obj_soul);
		}
		obj_soul.target_x = 245;
		obj_soul.target_y = 292 + menu_choice * 50 + 12;
	}
}
if goto_setting = true {
	if not instance_exists(inst) {
		room_goto(Room_Setting);
	}
}
if goto_battle = true {
	if not instance_exists(inst) {
		room_goto(Room_Battle);
	}
}

Key();


