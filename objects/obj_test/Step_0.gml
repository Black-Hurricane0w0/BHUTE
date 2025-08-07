time ++
if time == 1 {
	Player_SetSoul(true,270,true);
	ArenaSet(100*sqrt(3),200,0,,,,false);
    Player_PosSet(320,320);
    Player_Show();
    
    inst = ArenaCreateAddition(200,200,0);
    inst2 = ArenaCreateAddition(200,200,0);
    //inst3 = ArenaCreateAddition(100,100,0);
    //inst4 = ArenaCreateAddition(100,100,0);
    
} 

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 
	if time mod 60 == 0 {
		//BoneRotCreate(200,320,1,0,40,40,0,0,c_white,0.5,ac_default,,0,0,false,infinity)
        //Player_SetSoul(true,obj_move_soul.dir + 90,true);
        //PlatformCreate(320,400,0,1,1,1,false)
    } 
    //ArenaSetAddition(inst,300,200/sqrt(3) + 10,-30,ARENA_STATE.OUTSIDE,320 - 100,320 - 100 * sqrt(3) / 6,false)
    //ArenaSetAddition(inst2,300,200/sqrt(3) + 10,30,ARENA_STATE.OUTSIDE,320 + 100,320 - 100 * sqrt(3) / 6,false)
    //ArenaSetAddition(inst3,100 + 10,100,0,ARENA_STATE.INSIDE,320 - 100,320 - 125,true)
    //ArenaSetAddition(inst4,100+ 10,100,0,ARENA_STATE.INSIDE,320 + 100,320 - 125,true)
    ArenaSetAddition(inst,150,100,0,ARENA_STATE.OUTSIDE,mouse_x,mouse_y,false)
}
    