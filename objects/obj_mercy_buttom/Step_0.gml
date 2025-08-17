if obj_battle.battle_state == BATTLE_STATE.PLAYER{
	if obj_battle.battle_buttom_state == MENU.BUTTOM_CHOICE {
		if obj_battle.battle_buttom_choice == 4{
			image_index = 1;
		
			obj_soul.target_x = x - lengthdir_x(39,image_angle);
			obj_soul.target_y = y - lengthdir_y(39,image_angle);
			//划片
			//time += (90 - time) / 6;
		}else{
			image_index = 0;	
			//time -= time / 6;
		}
	}else {
		image_index = 0;
		//time -= time / 6;
	}
}else{
	image_index = 0;
	//time -= time / 6;
}
if time <= 0 {
	time = 0;
}
if abs(x - target_x) > 1 {
	x += (target_x - x ) / 4
}
if abs(y - target_y) > 1 {
	y += (target_y - y ) / 4
}
if obj_battle.ui_enable == true && obj_battle.buttom_enable == true {
	target_x = 555;
	target_y = 453;
}else {
	target_x = 555;
	target_y = 620;
}
bm.update(,state,image_index).run();
state = bm.value;