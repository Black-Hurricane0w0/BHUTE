
/**
 * 对决心造成伤害
 * @param {real} damage 伤害大小
 * @param {real} [invulnerable] 无敌时间(默认1s)
 */
function Player_Damage(damage,invulnerable = 60,calculate = true){
	if obj_move_soul.invulnerable == 0 {
		var amount = 0;
		if calculate {
			var hpmode = ceil(((File_Get(PLAYER_INFO.HP) - 20) / 10));
			amount = round(damage + hpmode - (File_Get(PLAYER_INFO.DEFENSE))/5);
			amount = clamp(amount,1,infinity);
		}else{
			amount = damage;
		}
		obj_battle.player_target_health -= amount;
		obj_move_soul.invulnerable = invulnerable;
		audio_play_sound(snd_hurt,0,false);
        Gamepad_Set_Vibration(5,0.2)
	}
	
}