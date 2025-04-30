time ++
if time == 1 {
	//开始事件
	ArenaSet(200,200,0,320,280);
	Player_SetSoul(true,270,true);
	dir = 90;
	obj_battle.ui_enable = true;
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY {
	if time mod 120 == 0 {
		//弹幕
		//bullet = instance_create_depth(0,0,-500,obj_magic_ball);
		if dir == 90 {
			dir = 270;
		}else {
			dir = 90;
		}
		Player_SetSoul(true,dir,true);
		Player_Drop(5,dir)
	}	
}

	

