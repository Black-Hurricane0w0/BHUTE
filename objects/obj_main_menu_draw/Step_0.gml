time ++ ;
if time == 120 {
	audio_play_sound(snd_logo,false,false);
}
var choice = Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) - Input_Check(INPUT.UP,INPUT_STEAT.PRESSED);

menu_choice += choice;
if choice != 0 and menu_choice >= 0 and menu_choice <= 2 audio_play_sound(snd_buttom_choice,0,false);
menu_choice = clamp(menu_choice,0,2);



if goto_battle = true || goto_setting = true  {
    fade ++;
    if fade == 1 {
        layer_sequence_create("seq",320,240,seq_main_line_out);
        audio_play_sound(snd_buttom_select,0,false);
        bm.add(30,[180,100,1],[-160,100,1]).reset();
        bm3.add(30,170,-60).reset();
        bm4.add(30,150,-60).reset();
        bm5.add(30,130,-60).reset();
        obj_soul.target_x = -100;
    }
    if fade == 2 {
        layer_sequence_destroy(main_line);
    }
    if fade == 32 {
        if goto_battle == true {
            room_goto(Room_Battle);
            audio_stop_sound(global.main_menu_music);
        }else if goto_setting {
            room_goto(Room_Setting);
        }
    }
}

if time > 290 and fade <= 0{
    switch (menu_choice) {
        case 0:
            obj_soul.target_x = 100;
            obj_soul.target_y = 220;
            if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) goto_battle = true;
            break;
        case 1:
            obj_soul.target_x = 80;
            obj_soul.target_y = 280;
            if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) goto_setting = true;
            break;
        case 2:
            obj_soul.target_x = 60;
            obj_soul.target_y = 340;
            break;
    }
}
if time == 480 and !audio_is_playing(global.main_menu_music) and Setting_Read(string,"Music") {
    audio_play_sound(global.main_menu_music,0,true);
}



