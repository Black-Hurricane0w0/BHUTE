time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,0);
}

if time mod 40 == 0 and  obj_battle.battle_state == BATTLE_STATE.ENEMY {

	var spawn_x = random_range(100,500);
	var spawn_y = random_range(100,400);
	var facing = point_direction(spawn_x,spawn_y,obj_move_soul.x,obj_move_soul.y);
	GB2Create(spawn_x,spawn_y,facing,1,40,20,,,,,ac_gb_01);
	//CameraPosSetInsize(random_range(100,500),random_range(100,400),300);
}