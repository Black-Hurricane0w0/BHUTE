if battle_state == BATTLE_STATE.PLAYER {
	if battle_buttom_state == MENU.FIGHT_MENU || battle_buttom_state == MENU.ACT_MENU {//FIGHT和ACT菜单
		if Enemy_mercy() {
			draw_set_color(c_yellow);
		}else {
			draw_set_color(c_white);
		}
		draw_set_font(fnt_mono);
		draw_text(90,270,"* " + string(Enemy_Infor_Get("enemy_name")));
		if battle_buttom_state == MENU.FIGHT_MENU {
			var point_hp = (Enemy_Infor_Get("hp") / Enemy_Infor_Get("max_hp")) * 100
			draw_healthbar(400,280,500,290,point_hp,c_red,make_color_rgb(0,205,0),make_color_rgb(0,255,0),0,true,false);
		}
		obj_soul.target_x = 70;
		obj_soul.target_y = 282;
		//返回
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED){
			if battle_buttom_state = MENU.FIGHT_MENU {
				battle_buttom_choice = 1;
			}
			if battle_buttom_state = MENU.ACT_MENU {
				battle_buttom_choice = 2;
			}
			battle_buttom_state = MENU.BUTTOM_CHOICE;
			
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
		//act
		draw_set_color(c_white);
		draw_set_font(fnt_mono);
		for (var i=0;i<array_length(Enemy_Infor_Get("id").action);i++) {
			draw_text(90,265 + i *30,"* " + string(Enemy_Infor_Get("id").action[i]));
		}
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED){//退出
			battle_buttom_state = MENU.ACT_MENU;
			battle_action_choice = 0;
			audio_play_sound(snd_buttom_select,0,false);
		}
		//act菜单选择
		if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED) {
			battle_action_choice --;
			audio_play_sound(snd_buttom_choice,0,false);
			if battle_action_choice < 0 {
				battle_action_choice = array_length(Enemy_Infor_Get("id").action) -1;
			}
		}else if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) {
			battle_action_choice ++;
			audio_play_sound(snd_buttom_choice,0,false);
			if battle_action_choice > array_length(Enemy_Infor_Get("id").action) -1 {
				battle_action_choice = 0;
			}
		}
		switch(battle_action_choice){//灵魂显示act菜单
			case 0:{
				obj_soul.target_x = 70;
				obj_soul.target_y = 282;
				break;
			}
			case 1:{
				obj_soul.target_x = 70;
				obj_soul.target_y = 282 + 30;
				break;
			}
			case 2:{
				obj_soul.target_x = 70;
				obj_soul.target_y = 282 + 60;
				break;
			}
			case 3:{
				obj_soul.target_x = 70;
				obj_soul.target_y = 282 + 90;
				break;
			}
		}
		//确认
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED){
			Enemy_Infor_Get("id").action_index = battle_action_choice;
			with(Enemy_Infor_Get("id")) {
				event_user(0);
			}
			instance_deactivate_object(obj_soul);
			battle_action_choice = 0;
			battle_state = BATTLE_STATE.ENCOUNTER_TEXT;
			battle_buttom_choice = 2;
			battle_buttom_state = MENU.BUTTOM_CHOICE;
		}
		
		
	}else if battle_buttom_state == MENU.ITEM_MENU {///物品菜单
		obj_soul.target_x = 70;
		obj_soul.target_y = 282 + battle_item_soul * 30;
		draw_set_color(c_white);
		draw_set_font(fnt_mono);
		var battle_item_print = 0;//打印变量
		for (i = battle_item_choice;i < battle_item_choice + 4;i++) {//循环i为当前选择
			if battle_item_print < 4 {
				if i - 4 < Item_Number() {//打印
					if battle_item_print = battle_item_soul and i - battle_item_soul < Item_Number() {
						draw_set_color(c_yellow);
						draw_set_alpha(1);
						draw_text(90,265 +battle_item_print * 30,"*" + string(Item_GetName(i - battle_item_soul)));	
					}else if i - battle_item_soul < Item_Number() {
						draw_set_color(c_white);
						draw_set_alpha(0.6 - 0.05 * battle_item_print);
						draw_text(90,265 +battle_item_print * 30,"*" + string(Item_GetName(i - battle_item_soul)));
					}
				}
				 battle_item_print ++;
			}
		}
		draw_set_alpha(1);
		battle_item_soul = clamp(battle_item_soul,0,3);
		if Input_Check(INPUT.DOWN,INPUT_STEAT.PRESSED) and battle_item_choice < Item_Number() - 1 {//向上按键和向下按键
			if battle_item_soul = 3 {
				battle_item_choice ++;
			}else if battle_item_soul < 3 {
				battle_item_soul ++;
				battle_item_choice ++;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}else if Input_Check(INPUT.UP,INPUT_STEAT.PRESSED) and battle_item_choice > 0 {
			if battle_item_soul = 0 {
				battle_item_choice --;
			}else if battle_item_soul > 0 {
				battle_item_choice --;
				battle_item_soul --;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}
		
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED) {//返回
			battle_buttom_choice = 3;
			battle_buttom_state = MENU.BUTTOM_CHOICE;
		}
		for (i=0;i<Item_Number();i++){
			if i = battle_item_choice {
				draw_set_color(c_yellow);
				draw_set_alpha(1);
				draw_circle(580,270 + i * 15,3,false);
			}else {
				draw_set_color(c_white);
				draw_set_alpha(0.5);
				draw_circle(580,270 + i * 15,2,false);	
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
		
	}else if battle_buttom_state == MENU.MERCY_MENU {//仁慈菜单
		if Enemy_mercy() {
			draw_set_color(c_yellow);
		}else {
			draw_set_color(c_white);
		} 
		draw_set_font(fnt_mono);
		draw_text(90,270,"* " + string(Enemy_Infor_Get("enemy_name")));
		obj_soul.target_x = 70;
		obj_soul.target_y = 285;
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0{
			battle_buttom_choice = 4;
			battle_buttom_state = MENU.BUTTOM_CHOICE;
			instance_deactivate_object(obj_soul);
			battle_state = BATTLE_STATE.ENCOUNTER_TEXT;
			if Enemy_Infor_Get("id").mercy >= 80 {
				audio_play_sound(snd_cloud,0,false);
				Battle_Dialogue_Add("You won.");
				battle_won = true;
			}
		}
		if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED) {
			battle_buttom_choice = 4;
			battle_buttom_state = MENU.BUTTOM_CHOICE;
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
		if battle_fight_over_time == 50 and (Enemy_Infor_Get("miss") == true || failed_attack == true) {
			//miss
			instance_create_depth(320,100,DEPTH.UI_TOP,obj_miss);
		}
		if battle_fight_over_time <= 0 {//时间为0
			if Enemy_Infor_Get("miss") == false and failed_attack == false {//没miss
				battle_buttom_state = MENU.FIGHT_DAMAGE;
				battle_fight_over_time = 60;
			}else {//miss了
				battle_buttom_state = MENU.BUTTOM_CHOICE;
				battle_state = BATTLE_STATE.ENEMY_DIALOGUE;
				instance_activate_object(obj_move_soul);
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
			target_health = Enemy_Infor_Get("hp") - round(File_Get(PLAYER_INFO.DAMAGE) * attack_distance * (1 - Enemy_Infor_Get("protection")/100));
			target_health = clamp(target_health,0,Enemy_Infor_Get("max_hp"));
			audio_play_sound(snd_damage,0,false);
			instance_create_depth(0,0,DEPTH.UI_TOP,obj_damage_num)
			with(obj_damage_num){
				damage = round(File_Get(PLAYER_INFO.DAMAGE) * attack_distance * (1 - Enemy_Infor_Get("protection")/100));
				event_user(0);
			}
			
			
		}
		Enemy_Infor_Set("hp",Enemy_Infor_Get("hp") - (Enemy_Infor_Get("hp") - target_health) / 4)
		var point_hp = Enemy_Infor_Get("hp") / Enemy_Infor_Get("max_hp") * 100;
		draw_healthbar(200,160,440,170,point_hp,c_red,make_color_rgb(0,205,0),make_color_rgb(0,255,0),0,true,false);
		
		
		
		battle_fight_over_time --;
		//切换状态
		if battle_fight_over_time < 0 {
			Enemy_Infor_Set("hp",target_health);
			battle_buttom_state = MENU.BUTTOM_CHOICE;
			battle_buttom_choice = 1;
			battle_state = BATTLE_STATE.ENEMY_DIALOGUE;
			instance_activate_object(obj_move_soul);
			instance_destroy(obj_target_choice);
			instance_destroy(obj_target);
			instance_destroy(obj_damage_num);
			instance_deactivate_object(obj_soul);
		}
		
		
	}else if battle_buttom_state == MENU.ACT_MENU {
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and choice_time < 0{
			battle_buttom_state = MENU.ACT_CHOICE //切换状态
			audio_play_sound(snd_buttom_select,0,false);
		}
	}
	
}
