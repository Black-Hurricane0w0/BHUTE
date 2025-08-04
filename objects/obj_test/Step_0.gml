time ++
if time == 1 {
	Player_SetSoul(true,270,true);
	ArenaSet(200,200,0);
    Player_PosSet(320,320);
    Player_Show();
    //PlatformCreate(320,400,0,0,1,1,false)
    inst = ArenaCreateAddition(200,200,0,320,320);
    inst2 = ArenaCreateAddition(200,200,0,320,320);
} 

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 
	if time mod 60 == 0 {
		BoneRotCreate(200,320,1,0,40,40,0,0,c_white,0.5,ac_default,,0,0,true,infinity)
        //Player_SetSoul(true,obj_move_soul.dir + 90,true);
    } 
    ArenaSetAddition(inst,100,100,30,ARENA_STATE.OUTSIDE,320,460,false)
    ArenaSetAddition(inst2,200,200,0,ARENA_STATE.INSIDE,420,320)
    ArenaCircle(inst,false,50)
    ArenaCircle(inst2,true,100)
}
    