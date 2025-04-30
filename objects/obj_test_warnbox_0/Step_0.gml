time ++
if time == 1 {
	//开始事件
	Player_SetSoul(false,270,true);
	ArenaSet(150,300,0);
}

if time mod 60 == 0 and obj_battle.battle_state == BATTLE_STATE.ENEMY {
	//弹幕
	WarnboxCreate(460,390,180,340,60);
}
	