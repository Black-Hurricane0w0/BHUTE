time ++
if time == 1 {
	Player_SetSoul(true,270,true);
	ArenaSet(200,200,30);
    Player_PosSet(220,320);
    Player_Show();
    //PlatformCreate(320,400,0,0,1,1,false)
    inst = ArenaCreateAddition(200,200,0,300,320) 
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 
	if time mod 60 == 0 {
		
    }
    ArenaSetAddition(inst,200,200,0,mouse_x,mouse_y)
}
    