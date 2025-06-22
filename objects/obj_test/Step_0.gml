time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,0);
    Player_PosSet(320,520);
    c = CreateAnim().add(120,0,120).anim("default").execute(function(t){
        test = t;
    })
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 
	if time mod 60 == 0 {
		BoneRotCreate(100,320,2,0,100,100,0,0,c_white,0.5,ac_bone_default,ac_bone_default,0,0,true,infinity,);
	}
    
    
    test = 0;

    c.run();
    log(test)
    
}