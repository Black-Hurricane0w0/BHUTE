time ++
if time == 1 {
	Player_SetSoul(true,270,true);
	bone = array_create(0);
	ArenaSet(150,300,0);
}


if obj_battle.battle_state == BATTLE_STATE.ENEMY {
	if time mod 60 == 0  {
		BoneRotCreate(270,320,1,0,0,60,270,0,c_white,0.5,ac_bone_speedup,ac_bone_speeddown,30,0);
		
	}
	
}

	

