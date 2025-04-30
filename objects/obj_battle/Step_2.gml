//血量限制
var hp = File_Get(PLAYER_INFO.HP);


hp = clamp(hp,0,File_Get(PLAYER_INFO.MAX_HP));


//回血动画
player_target_health = clamp(player_target_health,0,File_Get(PLAYER_INFO.MAX_HP))
var add_health = ( player_target_health - hp ) / 10
if abs(player_target_health - hp) <= 1 {
	File_Set(PLAYER_INFO.HP,player_target_health);
}else {
	File_Set(PLAYER_INFO.HP,hp + add_health);
}



