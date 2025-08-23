time ++
choice_time --;

if time == 30 {
    instance_create_depth(-16,100,DEPTH.SOUL,obj_soul)
}

if time >= 30 and fade < 1 {
    CameraPosSet(320,view * 60 + 240,640,480,30);
	if detailed_setting == false {
		//选择
		if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED) {//上
			setting_choice --;
            view_point --;
			if setting_choice >= 0 audio_play_sound(snd_buttom_choice,0,false);
		}
		if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) {//下
			setting_choice ++;
            view_point ++;
			if setting_choice <= setting_last audio_play_sound(snd_buttom_choice,0,false);
		}
        if view_point < 0 and setting_choice >= 0 {
            view --;
        }
        if view_point > 5 and setting_choice <= setting_last{
            view ++;
        }
        setting_choice = clamp(setting_choice,0,setting_last);
        view_point = clamp(view_point,0,5);
		obj_soul.target_x = 100;
		obj_soul.target_y = 100 + setting_choice * 60;
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED){//确认
			detailed_setting = true;
			choice_time = 10;
			obj_soul.target_x = 100 + 350;
            if setting_choice == 0 || setting_choice == 4 || setting_choice == 5 obj_soul.target_x = 100 + 350 - 80;
			obj_soul.target_y = 100 + setting_choice * 60;
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
			case 0 :{//0选项：总音量
                var value = clamp(Setting_Read(real,"Volume") + Input_Check(INPUT.RIGHT,INPUT_STEAT.KEEP) - Input_Check(INPUT.LEFT,INPUT_STEAT.KEEP),0,100)
				Setting_Write("Volume",value)
				audio_master_gain(clamp(Setting_Read(real,"Volume"),0,100)/100);
				break;
			}
			case 1 :{//1选项：雨
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0 {
					var vb = Setting_Read(string,"Raining");
				    Setting_Write("Raining",!vb);
				    audio_play_sound(snd_buttom_select,0,false);
				}
                break;
			}
			case 2 :{//2选项：雷
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0 {
					var vb = Setting_Read(string,"Lightning");
				    Setting_Write("Lightning",!vb);
				    audio_play_sound(snd_buttom_select,0,false);
				}
                break;
			}
			case 3 :{//3选项：音乐
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0 {
					var vb = Setting_Read(string,"Music");
				    Setting_Write("Music",!vb); 
                    audio_play_sound(snd_buttom_select,0,false);
                    audio_stop_sound(global.main_menu_music);
				}
                break;
			} 
            case 4 :{//4选项：音乐音量
                var value = clamp(Setting_Read(real,"Music Volume") + Input_Check(INPUT.RIGHT,INPUT_STEAT.KEEP) - Input_Check(INPUT.LEFT,INPUT_STEAT.KEEP),0,100)
	            Setting_Write("Music Volume",value)
				audio_group_set_gain(music,clamp(Setting_Read(real,"Music Volume"),0,100)/100,0);
                break;
			}
            case 5 :{//5选项：音效音量
                var value = clamp(Setting_Read(real,"Sound Effect Volume") + Input_Check(INPUT.RIGHT,INPUT_STEAT.KEEP) - Input_Check(INPUT.LEFT,INPUT_STEAT.KEEP),0,100)
	            Setting_Write("Sound Effect Volume",value)
				audio_group_set_gain(sound_effect,clamp(Setting_Read(real,"Sound Effect Volume"),0,100)/100,60);
                break;
			} 
            case 6 :{//6选项：全屏启动
				if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0 {
					var vb = Setting_Read(string,"Full Screen Startup");
				    Setting_Write("Full Screen Startup",!vb);
                    audio_play_sound(snd_buttom_select,0,false);
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
