function Player_Heal(heal){
	obj_battle.player_target_health += heal;
	audio_play_sound(snd_heal,0,false);
}