Glow(true,1);
time ++ ;

//跳过
if time < 120 and Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) {
    time = 120;
}
if time > 120 and time < 220 and Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) {
    time = 220;
    // 跳过标题动画
    if variable_instance_exists(self, "bm") {
        bm.skip(31);
    }
}
if time >= 260 and time < 320 and Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) {
    time = 320;
    // 跳过菜单项动画
    if variable_instance_exists(self, "bm3") bm3.skip(30);
    if variable_instance_exists(self, "bm4") bm4.skip(30);
    if variable_instance_exists(self, "bm5") bm5.skip(30);
}


if time == 120 {
	audio_play_sound(snd_logo,false,false);
}
getChoice = function(){
    //获取当前菜单列表
    var choice_struct = choice;
    for(var i = 0;i<string_length(choice_layer);i++){
        var str = "c"+ string_char_at(choice_layer,i + 1);
        choice_struct = choice_struct[$str];
    }
    //菜单列表
    choice_arr = [choice_struct.c0.name,choice_struct.c1.name,choice_struct.c2.name];
}
if anim_out == true  {
    fade ++;
    if fade == 1 {
        layer_sequence_create("seq",320,240,seq_main_line_out);
        audio_play_sound(snd_buttom_select,0,false);
        bm.add(30,[180,100,1],[-160,100,1]).delay(0).reset();
        bm3.add(30,170,-180).delay(0).reset();
        bm4.add(30,150,-180).delay(0).reset();
        bm5.add(30,130,-180).delay(0).reset();
        bm6.add(30,1,0).delay(0).reset();
        obj_soul.target_x = -100;
    }
    if fade == 2 {
        layer_sequence_destroy(main_line);
    }
    if fade == 32 {
        // 处理菜单项操作
        switch (choice_layer) {
            case "" : 
                switch (menu_choice) {
                    case 1:
                        room_goto(Room_Setting);
                        break;
                    case 2:
                        room_goto(Room_About)
                        break;
                }
                break;
            case "0" : 
                switch (menu_choice) {
                    case 0:
                        room_goto(Room_Battle);
                        audio_stop_sound(global.main_menu_music);
                        break;
                    case 1:
                        room_goto(Room_Battle);
                        audio_stop_sound(global.main_menu_music);
                        break;
                    case 2:
                        room_goto(Room_Battle);
                        audio_stop_sound(global.main_menu_music);
                        break;
                    }
                    break;  
        }
    }
}

if time > 260 and anim_out == false{
    // 获取当前菜单结构
    var choice_struct = choice;
    for(var i = 0; i < string_length(choice_layer); i++){
        var str = "c" + string_char_at(choice_layer, i + 1);
        choice_struct = choice_struct[$str];
    }
    
    // 计算当前菜单的选项数量
    var menu_count = 0;
    if variable_struct_exists(choice_struct, "c0") menu_count++;
    if variable_struct_exists(choice_struct, "c1") menu_count++;
    if variable_struct_exists(choice_struct, "c2") menu_count++;
    
    // 菜单选择逻辑
    var dir = Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) - Input_Check(INPUT.UP,INPUT_STEAT.PRESSED);
    if dir != 0 {
        menu_choice += dir;
        // 循环选择逻辑
        if menu_choice < 0 {
            menu_choice = menu_count - 1;
        } else if menu_choice >= menu_count {
            menu_choice = 0;
        }
        audio_play_sound(snd_buttom_choice,0,false);
    }
    
    // 子菜单导航逻辑
    if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) {
        //在动画中更新选项
        getChoice();
        // 检查当前选中项是否有子菜单
        var current_choice = "c" + string(menu_choice);
        if anim_choice_time > 0 {
            anim_choice_time = 0;
            bm3.skip(30);
            bm4.skip(30);
            bm5.skip(30);
        }else if variable_struct_exists(choice_struct[$current_choice], "c0") {
            // 进入子菜单
            choice_layer += string(menu_choice);
            menu_choice = 0;
            audio_play_sound(snd_buttom_select,0,false);
            anim_choice_time = anim_choice_time_max;
        } else {
            //进入淡出动画
            anim_out = true;
            getChoice();
            anim_choice_time = 0;
        }
    }
    
    // 返回上一级菜单
    if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED) and string_length(choice_layer) > 0 {
        //在动画中更新选项
        getChoice();
        //跳过动画
        if anim_choice_time > 0 {
            anim_choice_time = 0;
            bm3.skip(30);
            bm4.skip(30);
            bm5.skip(30);
        }else {
            // 移除最后一个字符，返回上一级
            anim_choice_time = anim_choice_time_max;
            choice_layer = string_copy(choice_layer, 1, string_length(choice_layer) - 1);
            menu_choice = 0;
            audio_play_sound(snd_buttom_select,0,false);
        }
    }
    
    // 调整灵魂位置
    var base_y = 220;
    var y_offset = menu_choice * 60;
    obj_soul.target_x = 90 - (menu_choice * 20);
    obj_soul.target_y = base_y + y_offset;
}




if time == 480 and !audio_is_playing(global.main_menu_music) and Setting_Read("real","Music") {
    audio_play_sound(global.main_menu_music,0,true);
}



