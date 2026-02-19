time ++
if time == 1 {
	//开始事件
	ArenaSet(200,200,0,320,280);
	Player_SetSoul(false,0,true);
    Player_Show();
	obj_battle.ui_enable = true;
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY {
    if time mod 120 == 1 {
        GBCreate(300,300,0,1,60,60,1,false,0.5,0,ac_gb_default,true);
    }
}
