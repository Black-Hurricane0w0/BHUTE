time ++
if time == 1 {
	Player_SetSoul(true,270,true);
	ArenaSet(200,200,0);
}

if time mod 100 == 0 and obj_battle.battle_state == BATTLE_STATE.ENEMY {
	var dir = round(random(3)) * 90;
	Player_Drop(15,dir); 
}