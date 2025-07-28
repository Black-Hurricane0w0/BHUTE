time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,0);
    Player_PosSet(220,320);
    Player_Show();
    //PlatformCreate(320,400,0,0,1,1,false)
    inst = ArenaCreateAddition(200,200,0,-100,-100);
    inst2 = ArenaCreateAddition(200,200,0,-100,-100);
    inst3 = ArenaCreateAddition(200,200,0,-100,-100);
    inst4 = ArenaCreateAddition(200,200,0,-100,-100);
} 

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 
	if time mod 360 == 0 {
		//BoneRotCreate(100,320,1,0,40,40,0,0,c_white,0.5,ac_default,,0,0,false,infinity)
        //Player_SetSoul(true,obj_move_soul.dir + 90,true);
    } 
    ArenaSetAddition(inst,200,200,time,ARENA_STATE.INSIDE,470,350)
    ArenaSetAddition(inst2,200,200,time/5,ARENA_STATE.INSIDE,270,350)
    ArenaSetAddition(inst3,200,200,time/5,ARENA_STATE.INSIDE,320,150)
    ArenaSetAddition(inst4,200,200,-time/5,ARENA_STATE.INSIDE,520,150)
}
    