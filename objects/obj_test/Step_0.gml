time ++
if time == 1 {
	Player_SetSoul(true,270,true);
	ArenaSet(200,200,0);
    Player_PosSet(320,320);
    Player_Show();
    PlatformCreate(320,400,0,0,1,1,false)
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 
	if time mod 60 == 0 {
		BoneRotCreate(100,320,2,0,100,100,0,0,c_white,0.5,ac_bone_default,ac_bone_default,0,0,true,infinity,);
	}
    
}