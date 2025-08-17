
player_target_health = clamp(player_target_health,0,File_Get(PLAYER_INFO.MAX_HP));
if abs(player_target_health - File_Get(PLAYER_INFO.HP)) > 1 {
    bm4.update(,File_Get(PLAYER_INFO.HP),player_target_health).run();
}else {
    File_Set(PLAYER_INFO.HP,player_target_health);
}
File_Set(PLAYER_INFO.HP,clamp(File_Get(PLAYER_INFO.HP),0,File_Get(PLAYER_INFO.MAX_HP)));
log(player_target_health)
