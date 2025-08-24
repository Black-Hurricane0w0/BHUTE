function Init(){
	//系统初始化
	Enemy_Dialogue_Init()
	File_Init();
	Input_lnit();
	Enemy_Init();
	Battle_Dialogue_Init();
	Item_Init();
	
	CameraPosInit();
    SaveLang();
    
    
	Key();
    
	//存储
	File_Set(PLAYER_INFO.NAME,"Frisk");
	File_Set(PLAYER_INFO.LV,19);
	File_Set(PLAYER_INFO.HP,92);
	File_Set(PLAYER_INFO.MAX_HP,92);
	File_Set(PLAYER_INFO.X,0);
	File_Set(PLAYER_INFO.Y,0);
	File_Set(PLAYER_INFO.DAMAGE,19);
    File_Set(PLAYER_INFO.KR,0);

	window_set_caption("BHUTE");
    
	global.soul_color = SOUL_STATE.RED;
    //弹幕清除范围
    global.buttle_range = 500;
    //遮罩延伸范围
    global.surface_wide = 300;
    //KR启用
    global.kr_enable = true;
    //手柄遥感触发阈值
    global.gamepad_value = 0.1;
    //主菜单背景音乐
    global.main_menu_music = mus_sanctuary;
    //语言选项
    global.language_list = ["en","zh"];
    //设置初始化
    Setting_Init();
    
    global.lang_map = -1;
	ReadLang();
    
    

	//声音设置
	audio_master_gain(clamp(Setting_Read(real,"Volume"),0,100)/100);
    audio_group_set_gain(sound_effect,clamp(Setting_Read(real,"Sound Effect Volume"),0,100)/100,0);
    audio_group_set_gain(music,clamp(Setting_Read(real,"Music Volume"),0,100)/100,0);
    audio_group_load(music);
    audio_group_load(sound_effect);

}