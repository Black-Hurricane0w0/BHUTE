if battle_state == BATTLE_STATE.PLAYER {
	if battle_buttom_state == MENU.FIGHT_MENU || battle_buttom_state == MENU.ACT_MENU || battle_buttom_state == MENU.MERCY_MENU {//FIGHT和ACT菜单
		draw_set_font(fnt_mono);
        draw_set_valign(fa_middle);
        for (var i = 0; i < Enemy_Number(); i++) {
            if Enemy_Mercy(i) {
    			draw_set_color(c_yellow);
    		}else {
    			draw_set_color(c_white);
    		}
        	draw_text(90,285 + i * 30,"* " + string(Enemy_Infor_Get("enemy_name",i)));
            if battle_buttom_state == MENU.FIGHT_MENU {
			    var point_hp = (Enemy_Infor_Get("hp",i) / Enemy_Infor_Get("max_hp",i)) * 100;
			    draw_healthbar(400,285 + i * 30,500,295 + i * 30,point_hp,c_red,make_color_rgb(0,205,0),make_color_rgb(0,255,0),0,true,false);
	    	}
        }
        draw_set_valign(fa_top);
		obj_soul.target_x = 70;
		obj_soul.target_y = 287 + battle_target_choice * 30;
		//返回
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED){
			if battle_buttom_state = MENU.FIGHT_MENU {
				battle_buttom_choice = 1;
			}
			if battle_buttom_state = MENU.ACT_MENU {
				battle_buttom_choice = 2;
			}
            if battle_buttom_state = MENU.MERCY_MENU {
				battle_buttom_choice = 4;
			}
			battle_buttom_state = MENU.BUTTOM_CHOICE;
		}
        
        //选择
        if Enemy_Number() > 1 { 
            if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED){//向上按键和向下按键
                if battle_target_choice = Enemy_Number() - 1 {
    				battle_target_choice = 0;
    			}else{
                    battle_target_choice ++;
                }
    			audio_play_sound(snd_buttom_choice,0,false);
    		}else if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED){
                if battle_target_choice = 0 {
    				battle_target_choice = Enemy_Number() - 1;
    			}else{
                    battle_target_choice --;
                }
    			audio_play_sound(snd_buttom_choice,0,false);
    		}
        }
	} 
    //确认
	if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and battle_buttom_state == MENU.FIGHT_MENU and choice_time < 0 {
		audio_play_sound(snd_buttom_select,0,false);
		if battle_buttom_state == MENU.FIGHT_MENU {//FIGHT
			battle_buttom_state = MENU.FIGHT_TARGET;
			if instance_exists(obj_target_choice) == false {//目标选择器
				var random_count = irandom_range(0,1);
				instance_create_depth(320 + (random_count ? 300 : -300),640,DEPTH.UI_TOP,obj_target_choice);
				obj_target_choice.state = random_count;
			}			
			if instance_exists(obj_target) == false {//目标
				instance_create_depth(320,320,DEPTH.UI_TOP,obj_target);
			}
		}
	}else if battle_buttom_state == MENU.ACT_CHOICE {
        //act菜单选择
        battle_action_soul = clamp(battle_action_soul,0,3);
		draw_set_color(c_white);
		draw_set_font(fnt_mono);
        draw_set_valign(fa_middle);
		var battle_action_print = 0;//打印变量
        var action_length = array_length(Enemy_Infor_Get("id",0).action);
		for (var i = battle_action_choice;i < battle_action_choice + 4;i++) {//循环i为当前选择
			if battle_action_print < 4 { //打印
				if battle_action_print = battle_action_soul and i - battle_action_soul < action_length {
					draw_set_color(c_yellow);
					draw_set_alpha(1);
					draw_text(90,275 +battle_action_print * 30,"*" + Enemy_Infor_Get("id",0).action[i - battle_action_soul]);	
				}else if i - battle_action_soul < action_length {
					draw_set_color(c_white);
					draw_set_alpha(0.6 - 0.05 * battle_action_print);
					draw_text(90,275 +battle_action_print * 30,"*" + Enemy_Infor_Get("id",0).action[i - battle_action_soul]);
				}
                battle_action_print ++;
			}
		}
        draw_set_valign(fa_top);
		draw_set_alpha(1);
		//act
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED){//退出
			battle_buttom_state = MENU.ACT_MENU;
			battle_action_choice = 0;
            battle_action_soul = 0;
			audio_play_sound(snd_buttom_select,0,false);
		}
        obj_soul.target_x = 70;
		obj_soul.target_y = 277 + battle_action_soul * 30;
        if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) and battle_action_choice < action_length - 1 {//向上按键和向下按键
            if battle_action_soul = 3 {
				battle_action_choice ++;
			}else if battle_action_soul < 3 {
				battle_action_soul ++;
				battle_action_choice ++;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}else if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED) and battle_action_choice > 0 {
            if battle_action_soul = 0 {
				battle_action_choice --;
			}else if battle_action_soul > 0 {
				battle_action_choice --;
				battle_action_soul --;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}
		//确认
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED){
			Enemy_Infor_Get("id",battle_target_choice).action_index = battle_action_choice;
			with(Enemy_Infor_Get("id",battle_target_choice)) {
				event_user(0);
			}
			instance_deactivate_object(obj_soul);
			battle_action_choice = 0;
            battle_action_soul = 0;
			battle_state = BATTLE_STATE.ENCOUNTER_TEXT;
			battle_buttom_choice = 2;
			battle_buttom_state = MENU.BUTTOM_CHOICE;
		}
	}else if battle_buttom_state == MENU.ITEM_MENU {///物品菜单
		obj_soul.target_x = 70;
		obj_soul.target_y = 277 + battle_item_soul * 30;
		draw_set_color(c_white);
		draw_set_font(fnt_mono);
        draw_set_valign(fa_middle);
		var battle_item_print = 0;//打印变量
		for (var i = battle_item_choice;i < battle_item_choice + 4;i++) {//循环i为当前选择
			if battle_item_print < 4 {
				if battle_item_print = battle_item_soul and i - battle_item_soul < Item_Number() {
					draw_set_color(c_yellow);
					draw_set_alpha(1);
					draw_text(90,275 +battle_item_print * 30,"*" + string(Item_GetName(i - battle_item_soul)));	
				}else if i - battle_item_soul < Item_Number() {
					draw_set_color(c_white);
					draw_set_alpha(0.6 - 0.05 * battle_item_print);
					draw_text(90,275 +battle_item_print * 30,"*" + string(Item_GetName(i - battle_item_soul)));
				}
				 battle_item_print ++;
			}
		}
        draw_set_valign(fa_top);
		draw_set_alpha(1);
		battle_item_soul = clamp(battle_item_soul,0,3);
        var battle_item_changed = false;
		if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) and battle_item_choice < Item_Number() - 1 {//向上按键和向下按键
			last_item_choice = battle_item_choice;//获取上一次的item_choice，并将更新item_choice
            if battle_item_soul = 3 {
				battle_item_choice ++;
			}else if battle_item_soul < 3 {
				battle_item_soul ++;
				battle_item_choice ++;
			}
            battle_item_changed = true;
			audio_play_sound(snd_buttom_choice,0,false);
		}else if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED) and battle_item_choice > 0 {
			last_item_choice = battle_item_choice;//获取上一次的item_choice，并将更新item_choice
            if battle_item_soul = 0 {
				battle_item_choice --;
			}else if battle_item_soul > 0 {
				battle_item_choice --;
				battle_item_soul --;
			}
            battle_item_changed = true;
			audio_play_sound(snd_buttom_choice,0,false);
		}
		
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED) {//返回
			battle_buttom_choice = 3;
			battle_buttom_state = MENU.BUTTOM_CHOICE;
		}
		for (j=0;j<Item_Number();j++){
			if j = battle_item_choice {
                //按下了按键，重新刷新动画
                if battle_item_changed {
                    bm.reset();
                }
                bm.run();
			}else {
                //如果是被按走的槽位，重新刷新动画
                if last_item_choice == j {
                    if battle_item_changed {
                        bm2.reset();
                    }
                    bm2.run();
                }else{
                    draw_sprite_ext(spr_battle_edge,0,580,267.5 + j *15,2,2,0,c_white,0.5);
                }
                
			}
		}
		draw_set_alpha(1);
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0{//确认
			Item_Use(battle_item_choice);
			instance_deactivate_object(obj_soul);
			battle_item_choice = 0;
			battle_item_print = 0;
			battle_item_soul = 0;
			battle_buttom_choice = 3;
			battle_buttom_state = MENU.BUTTOM_CHOICE;
			battle_state = BATTLE_STATE.ENCOUNTER_TEXT;
		}
	}
	if battle_buttom_state == MENU.FIGHT_TARGET {//转到FIGHT.攻击
		instance_deactivate_object(obj_soul);
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and obj_target_choice.time >= 21 {
			battle_buttom_state = MENU.FIGHT_ANIM;
			audio_play_sound(snd_laz,0,false);
			instance_create_depth(320,140,DEPTH.UI_TOP,obj_attack);//刀刃
			battle_fight_over_time = 80;//计时器
		}
		//超时
		if obj_target_choice.state == 0 and obj_target_choice.x >= 620 {
			battle_buttom_state = MENU.FIGHT_ANIM;
			failed_attack = true;
			battle_fight_over_time = 80;
		}else if obj_target_choice.state == 1 and obj_target_choice.x <= 20 {
			battle_buttom_state = MENU.FIGHT_ANIM;
			failed_attack = true;
			battle_fight_over_time = 80;
		}else{
			failed_attack = false;
			battle_fight_over_time = 80;
		}
	}else if battle_buttom_state == MENU.FIGHT_ANIM {//转到FIGHT.攻击完成
		battle_fight_over_time -= 1;
		if battle_fight_over_time == 50 and (Enemy_Infor_Get("miss",battle_target_choice) == true || failed_attack == true) {
			//miss
			instance_create_depth(320,100,DEPTH.UI_TOP,obj_miss);
		}
		if battle_fight_over_time <= 0 {//时间为0
			if Enemy_Infor_Get("miss",battle_target_choice) == false and failed_attack == false {//没miss
				battle_buttom_state = MENU.FIGHT_DAMAGE;
				battle_fight_over_time = 60;
			}else {//miss了
				battle_buttom_state = MENU.BUTTOM_CHOICE;
				battle_state = BATTLE_STATE.ENEMY_DIALOGUE;
				instance_destroy(obj_target_choice);
				instance_destroy(obj_target);
				instance_destroy(obj_damage_num);
			}
			
		}
	}else if battle_buttom_state == MENU.FIGHT_DAMAGE {
		if battle_fight_over_time == 60 {
			var attack_distance = 0
			with(obj_target_choice){
				attack_distance = -(1/300) * distance_to_point(320,320) + 1;
				if distance_to_point(320,320) <= 2 {
					attack_distance *= 1.5;
				}
			}
			target_health = Enemy_Infor_Get("hp",battle_target_choice) - round(File_Get(PLAYER_INFO.DAMAGE) * attack_distance * (1 - Enemy_Infor_Get("protection",battle_target_choice)/100));
			target_health = clamp(target_health,0,Enemy_Infor_Get("max_hp",battle_target_choice));
			audio_play_sound(snd_damage,0,false);
			instance_create_depth(0,0,DEPTH.UI_TOP,obj_damage_num)
			with(obj_damage_num){
				damage = round(File_Get(PLAYER_INFO.DAMAGE) * attack_distance * (1 - Enemy_Infor_Get("protection",obj_battle.battle_target_choice)/100));
				event_user(0);
			}
			bm3 = CreateAnim().add(20,Enemy_Infor_Get("hp",battle_target_choice),target_health).anim(ac_fight_healthbar).execute(function(t){ 
                var point_hp = t / Enemy_Infor_Get("max_hp",battle_target_choice) * 100;
                draw_healthbar(200,160,440,170,point_hp,c_red,make_color_rgb(0,205,0),make_color_rgb(0,255,0),0,true,false);
            })
			Enemy_Infor_Set("hp",target_health,battle_target_choice);
		}
        bm3.run();
        
		battle_fight_over_time --;
		//切换状态
		if battle_fight_over_time < 0 {
			Enemy_Infor_Set("hp",target_health,battle_target_choice);
			battle_buttom_state = MENU.BUTTOM_CHOICE;
			battle_buttom_choice = 1;
			battle_state = BATTLE_STATE.ENEMY_DIALOGUE;
			instance_destroy(obj_target_choice);
			instance_destroy(obj_target);
			instance_destroy(obj_damage_num);
			instance_deactivate_object(obj_soul);
            with(Enemy_Infor_Get("id",battle_target_choice)){
                event_user(1);
            }
		}
	}else if battle_buttom_state == MENU.ACT_MENU {
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0{
			battle_buttom_state = MENU.ACT_CHOICE //切换状态
			audio_play_sound(snd_buttom_select,0,false);
		}
	}else if battle_buttom_state == MENU.MERCY_MENU {
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0{ 
            battle_buttom_choice = 4;
			battle_buttom_state = MENU.BUTTOM_CHOICE;
			instance_deactivate_object(obj_soul); 
			battle_state = BATTLE_STATE.ENCOUNTER_TEXT;
    		if Enemy_Infor_Get("id",battle_target_choice).mercy >= 80 { 
                audio_play_sound(snd_cloud,0,false);
                if Enemy_Number() <= 1 {
                   Battle_Dialogue_Add("You won."); 
                   battle_won = true;
                }else{
                   Enemy_Remove(battle_target_choice);
                }
            }
			audio_play_sound(snd_buttom_select,0,false);
		}
	}
	
}

