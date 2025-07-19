time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,30);
    Player_PosSet(220,320);
    Player_Show();
    //PlatformCreate(320,400,0,0,1,1,false)
    inst = ArenaCreateAddition(200,200,0,300,320) 
} 

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 
	if time mod 60 == 0 {
		BoneNoRotCreate(100,320,1,0,40,40,c_white,0.5)
    }
    log(inst.object_index)
    ArenaSetAddition(inst,200,200,0,ARENA_STATE.OUTSIDE,200,300)
}
    