//调试屏幕
if not surface_exists(global.debug_surface) {
	global.debug_surface = surface_create(640,480);
}
surface_set_target(global.debug_surface);
draw_clear_alpha(c_white,0);
surface_reset_target();


//淡入
if instance_exists(fadein_inst) == true {
	if battle_state == BATTLE_STATE.PLAYER {
		instance_activate_object(obj_soul);
		Player_Hide();
	}else if battle_state == BATTLE_STATE.ENEMY {
		instance_deactivate_object(obj_soul);
		Player_Show();
		if ui_enable == false {
			Player_Hide();
		}
	}
	return;
}



//Buttom选择
if battle_state = BATTLE_STATE.PLAYER and ui_enable = true{//是玩家回合
	ArenaSet(140,575,0,320,320)
	if battle_buttom_state = MENU.BUTTOM_CHOICE{//是按钮选择阶段
		instance_activate_object(obj_soul);
		Player_Hide();
		if Input_Check(INPUT.RIGHT,INPUT_STEAT.PRESSED){
			battle_buttom_choice += 1;
			if battle_buttom_choice > 4{
				battle_buttom_choice = 1;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}
		if Input_Check(INPUT.LEFT,INPUT_STEAT.PRESSED){
			battle_buttom_choice -= 1;
			if battle_buttom_choice <=0{
				battle_buttom_choice = 4;
			}
			audio_play_sound(snd_buttom_choice,0,false);
		}
	}
	
	if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED) and battle_buttom_state == MENU.BUTTOM_CHOICE{//主界面选择菜单
		audio_play_sound(snd_buttom_select,0,false);
		switch(battle_buttom_choice){
			case 1:{
				battle_buttom_state = MENU.FIGHT_MENU;
				choice_time = 2;
				break
			}
			case 2:{
				battle_buttom_state = MENU.ACT_MENU;
				choice_time = 2;
				break
			}
			case 3:{
				if Item_Number() > 0 {
					battle_buttom_state = MENU.ITEM_MENU;
					choice_time = 2;
					battle_item_choice = 0;
					battle_item_soul = 0;
				}else {
					audio_stop_sound(snd_buttom_select);
				}
				
				break
			}
			case 4:{
				battle_buttom_state = MENU.MERCY_MENU;
				choice_time = 2;
				break
			}
		}
	}
	
}
choice_time --;

if battle_state = BATTLE_STATE.PLAYER{
	if battle_buttom_state = MENU.BUTTOM_CHOICE{
		if not instance_exists(battle_ui_dialogue) {
			//如果没有旁白实例，那么生成一个，并记录ID
			battle_ui_dialogue = CreateText(70,280,DEPTH.UI_TOP,"* " + battle_ui_dialogue_text,battle_ui_dialogue_color);
		}
	}else{
			instance_destroy(battle_ui_dialogue);//销毁旁白实例
	}
}
if battle_state = BATTLE_STATE.ENCOUNTER_TEXT {
    Player_PosSet(obj_battle_arena.x,obj_battle_arena.y);
	if not instance_exists(battle_ui_dialogue) {
		if Battle_Dialogue_Size() > 0 {
			battle_ui_dialogue = CreateText(70,270,DEPTH.UI_TOP,"* " + Battle_Dialogue_Get());
			battle_ui_dialogue.can_destroy = true;
		}else {
			battle_state = BATTLE_STATE.ENEMY_DIALOGUE;
			if battle_won == true {
				Won();
			}
		}
	}
}

//全屏
Full_Screen()
//雨
if Setting_Read(string,"Raining") == true {
	effect_create_below(ef_rain,x,y,0,c_ltgray);
    if audio_is_playing(snd_raining) == false {
        audio_play_sound(snd_raining,0,true);
    }
}
//重开
Replay();

//怪物对话阶段
if battle_state == BATTLE_STATE.ENEMY_DIALOGUE {
	obj_move_soul.dir = 270;
	if Enemy_Dialogue_Size() > 0  {
		if not instance_exists(obj_dialogue) {
			instance_create_depth(420,90,DEPTH.ENEMY,obj_dialogue)
		}
	}else {
		if not instance_exists(obj_dialogue){
			battle_state = BATTLE_STATE.ENEMY;
        	obj_move_soul.invulnerable = 0;
		}
		if not instance_exists(obj_dialogue) and Enemy_Infor_Get("hp") <= 0{
			Won();
		}
	}
	
}
if battle_state == BATTLE_STATE.ENEMY {
	if not instance_exists(turn_inst){
		if not object_exists(turn_inst){
			Battle_TurnEnd();
		}
		instance_create_depth(0,0,0,turn_inst);
	}
	if turn_time <= 0 {
		Battle_TurnEnd();
	}else {
		turn_time --;
	}
}else {
	Battle_TurnSetTime(Enemy_Infor_Get("id").turn_max_time);
}





