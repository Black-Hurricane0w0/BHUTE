time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,0);
}


if time mod 5 == 0 and obj_battle.battle_state == BATTLE_STATE.ENEMY {
	BoneCreate(100,420,0,3,50 * sin(2 * degtorad(time)) + 80);
	BoneCreate(100,220,2,-3,65 - 50 * sin(2 * degtorad(time)))
}
	

