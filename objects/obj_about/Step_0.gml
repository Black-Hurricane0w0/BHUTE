time ++


if time == 30 {
    instance_create_depth(-16,100,DEPTH.SOUL,obj_soul)
}

if time >= 30 and fade < 1 {
	//选择
	if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED) {//上
		about_choice --;
		if about_choice >= 0 audio_play_sound(snd_buttom_choice,0,false);
	}
	if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) {//下
		about_choice ++;
		if about_choice <= about_last audio_play_sound(snd_buttom_choice,0,false);
	}
    about_choice = clamp(about_choice,0,about_last);
	obj_soul.target_x = 100;
	obj_soul.target_y = 100 + about_choice * 60;
	if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED){//确认
		audio_play_sound(snd_buttom_select,0,false);
        switch (about_choice) {
    		case 0 :{//0选项：
                url_open("https://undertale.com/")
                break;
    		}		
            case 1 :{//0选项：
                url_open("https://space.bilibili.com/549607159?spm_id_from=333.1007.0.0")
    		}
    	}
	}
	if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED){//返回
		fade = 1;
		audio_play_sound(snd_buttom_select,0,false);
	};
}
if fade >= 1 {
    fade ++
    if fade == 2{
        bm.add(30,120,-120).reset();
        bm2.add(30,120 + 350,640 + 120).reset();
        obj_soul.target_x = -100;
    }
    if fade >= 32 {
        room_goto(Room_Main_Menu);
    }
}
