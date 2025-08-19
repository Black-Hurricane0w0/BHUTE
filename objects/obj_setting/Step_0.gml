time ++
choice_time --;

if time == 30 {
    instance_create_depth(-16,100,DEPTH.SOUL,obj_soul)
}

if time >= 30 and fade < 1 {
	if detailed_setting == false {
		//选择
		if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED) {//上
			setting_choice --;
			if setting_choice < 0 {
				setting_choice = 4;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}
		if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) {//下
			setting_choice ++;
			if setting_choice > 4 {
				setting_choice = 0;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}
		obj_soul.target_x = 100;
		obj_soul.target_y = 100 + setting_choice * 60 + 20;
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED){//确认
			detailed_setting = true;
			choice_time = 10;
			obj_soul.target_x = 100 + 350;
			obj_soul.target_y = 100 + setting_choice * 60 + 20;
			audio_play_sound(snd_buttom_select,0,false);
		}
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED){//返回
			fade = 1;
			audio_play_sound(snd_buttom_select,0,false);
		}
		keep_down_time = 0;
	}
    if detailed_setting == true {
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED){//确认
			detailed_setting = false;
			audio_play_sound(snd_buttom_select,0,false);
		}
		switch (setting_choice) {
			case 0 :{//0选项：音量
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.KEEP) and choice_time < 0 {
					Setting_Write("Volume",Setting_Read(real,"Volume") + 1)
					if Setting_Read(real,"Volume") > 100 {
						Setting_Write("Volume",0)
					}
					keep_down_time ++;
					if keep_down_time < 5 {
						choice_time = 10;
						audio_play_sound(snd_buttom_select,0,false);
					}else {
						choice_time = 0;
					}
					audio_master_gain(Setting_Read(real,"Volume")/100);
				}else if choice_time < 0 {
					keep_down_time = 0;
				}
				break;
			}
			case 1 :{//1选项：震动
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0 {
					var vb = Setting_Read(string,"Vibration");
				    Setting_Write("Vibration",!vb);
				    audio_play_sound(snd_buttom_select,0,false);
                }
                break;
			}
			case 2 :{//2选项：雨
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0 {
					var vb = Setting_Read(string,"Raining");
				    Setting_Write("Raining",!vb);
				    audio_play_sound(snd_buttom_select,0,false);
				}
                break;
			}
			case 3 :{//3选项：雷
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0 {
					var vb = Setting_Read(string,"Lightning");
				    Setting_Write("Lightning",!vb);
				    audio_play_sound(snd_buttom_select,0,false);
				}
                break;
			}
			case 4 :{//4选项：音乐
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0 {
					var vb = Setting_Read(string,"Music");
				    Setting_Write("Music",!vb); 
                    audio_play_sound(snd_buttom_select,0,false);
                    audio_stop_sound(global.main_menu_music);
				}
                break;
			}
		}
	}
}
if fade >= 1 {
    fade ++
    if fade == 2{
        bm.add(30,120,-60).reset();
        bm2.add(30,120 + 350,640 + 60).reset();
        obj_soul.target_x = -100;
    }

    if fade >= 32 {
        room_goto(Room_Main_Menu);
    }
}
