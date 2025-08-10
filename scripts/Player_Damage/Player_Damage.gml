function Player_Damage(damage,invulnerable = 60){
	if obj_move_soul.invulnerable == 0 {
		obj_battle.player_target_health -= damage;
		audio_play_sound(snd_hurt,0,false);
		obj_move_soul.invulnerable = invulnerable;
	}
	
}