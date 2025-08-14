var hp = player_target_health
player_target_health = clamp(hp,0,File_Get(PLAYER_INFO.MAX_HP));
bm4.update(,File_Get(PLAYER_INFO.HP),player_target_health).run();
File_Set(PLAYER_INFO.HP,clamp(hp,0,File_Get(PLAYER_INFO.MAX_HP)));
