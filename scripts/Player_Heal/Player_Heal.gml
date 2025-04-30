function Player_Heal(heal){
	obj_battle.player_target_health = File_Get(PLAYER_INFO.HP) + heal;
	audio_play_sound(snd_heal,0,false);
}