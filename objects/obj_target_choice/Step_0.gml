//向上运动
if y > 320 && time == 0 {
	y -= 16;
	image_angle -= 2.25;
}
if y == 320 {
	time ++;
}

//行进
if time > 20 and obj_battle.battle_buttom_state == MENU.FIGHT_TARGET {
	var _x = time - 20;
	if state == 0 {
		x = 20 + 25/48 * sqr(_x);
	}else if  state == 1 {
		x = 620 - 25/48 * sqr(_x);
	}
}
//按下攻击
if obj_battle.battle_buttom_state == MENU.FIGHT_ANIM {
	image_alpha -= 0.05;
	image_xscale += 0.02;
	image_yscale += 0.02;
}

