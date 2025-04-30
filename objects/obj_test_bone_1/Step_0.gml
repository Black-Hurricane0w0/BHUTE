time ++
if time == 1 {
	Player_SetSoul(true,270,true);
	
	ArenaSet(150,300,0);
}


if time mod 80 == 0 and obj_battle.battle_state == BATTLE_STATE.ENEMY {
	var high = random_range(6,20);
	Player_Drop(8,270);
	BoneCreate(170,390,0,4,high);
	BoneCreate(470,390,0,-4,high);
	BoneCreate(170,240,2,-4,110 - high);
	BoneCreate(470,240,2,4,110 - high);
}
	

