if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}


time ++;

if time >= keep_time {
	instance_destroy();
}