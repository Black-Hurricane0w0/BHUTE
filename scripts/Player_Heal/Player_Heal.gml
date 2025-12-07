/// @desc 恢复决心生命值
/// @param {real} heal 恢复生命值大小
function Player_Heal(heal){
	obj_battle.player_target_health += heal;
	audio_play_sound(snd_heal,0,false);
}