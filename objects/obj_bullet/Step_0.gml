if place_meeting(x,y,obj_move_soul){
	Player_Damage(damage);
} 
if obj_battle.battle_state != BATTLE_STATE.ENEMY {
	instance_destroy();
}
if distance_to_object(obj_battle_arena) >= 600 {
	instance_destroy();
}