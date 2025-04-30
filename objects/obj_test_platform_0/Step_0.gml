time ++
if time == 1 {
	//开始事件
	ArenaSet(200,200,0,320,280);
	Player_SetSoul(true,270,true);
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY {
	if time mod 300 == 0 {
		//弹幕
		PlatformCreate(240,320,0,0.25,1,1);
	}	
}

	
