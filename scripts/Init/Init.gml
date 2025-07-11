function Init(){
	//系统初始化
	Enemy_Dialogue_Init()
	File_Init();
	Input_lnit();
	Enemy_Init();
	Battle_Dialogue_Init();
	Item_Init();
	Setting_Init();
	CameraPosInit();

	Key();
    
	//存储
	File_Set(PLAYER_INFO.NAME,"Frisk");
	File_Set(PLAYER_INFO.LV,19);
	File_Set(PLAYER_INFO.HP,92);
	File_Set(PLAYER_INFO.MAX_HP,92);
	File_Set(PLAYER_INFO.X,0);
	File_Set(PLAYER_INFO.Y,0);
	File_Set(PLAYER_INFO.DAMAGE,19);

	window_set_caption("BHUTE");

	global.soul_color = SOUL_STATE.RED;
	
	//声音设置
	audio_master_gain(Setting_Read(real,"Volume")/100);

}