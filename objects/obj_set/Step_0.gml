Key();
CameraPosTick();
Shook_Tick();


//debug
if debug == true {
	if instance_exists(obj_battle){
		obj_battle.player_target_health = File_Get(PLAYER_INFO.MAX_HP);
		if keyboard_check_pressed(vk_f1) {
			if obj_battle.ui_enable == true {
				obj_battle.ui_enable = false;
			}else {
				obj_battle.ui_enable = true;
			}
		}
	}
	
}
//退出
if keyboard_check(vk_escape) {
	esc ++;
	if esc >= 60 {
		game_end(0);
	}
}else {
	esc = 0;
}
