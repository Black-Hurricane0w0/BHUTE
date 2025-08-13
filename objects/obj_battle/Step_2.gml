
bm4.update(,File_Get(PLAYER_INFO.HP),player_target_health).run();
var hp = player_target_health
File_Set(PLAYER_INFO.HP,clamp(hp,0,File_Get(PLAYER_INFO.MAX_HP)));
