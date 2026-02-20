time ++
if time == 1 {
	//开始事件
	ArenaSet(200,200,0,320,280);
	Player_SetSoul(false,0,true);
    Player_Show();
	obj_battle.ui_enable = true;
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY {
    if time mod 120 == 0 {
        BoneRotCreate(100,300,10,0,100,100,100,2,c_white,0.2,ac_bone_default,ac_bone_default,60,10000,false,infinity)
    }
}
