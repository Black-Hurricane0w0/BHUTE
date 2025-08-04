//定义常量
enum PLAYER_INFO{
	NAME,
	LV,
	HP,
	MAX_HP,
	X,
	Y,
	DAMAGE
}

//定义回合
enum BATTLE_STATE{
	ENEMY,
	PLAYER,
	ENEMY_DIALOGUE,
	DIALOGUE,
	ENCOUNTER_TEXT
}
//图层
enum DEPTH{
	BG = 0,
	ENEMY = -100,
	UI_BUTTOM = -200,
	BULLET = -300,
	ARENA = -400,
	UI_TOP = -500,
	BULLET_OUTSIDE = -600,//无遮罩
	SOUL = -700,
	BULLET_TOP = -800,//顶层子弹
}
//菜单
enum MENU{
	BUTTOM_CHOICE,
	FIGHT_MENU,
	FIGHT_TARGET,
	FIGHT_ANIM,
	FIGHT_DAMAGE,
	ACT_MENU,
	ACT_CHOICE,
	ITEM_MENU,
	ITEM_CHOICE,
	MERCY_MENU

}
//一些向量有关的常量
enum Vector2 {
    X,
    Y,
}
//决心状态
enum SOUL_STATE {
    RED,
    BLUE
}
//战斗框状态
enum ARENA_STATE {
    INSIDE,
    OUTSIDE,
    NOHIT
}
	

//宏定义
#macro log show_debug_message
//用法:log(message)
#macro elif else if




math_set_epsilon(0.000001)

Init();

room_goto(Room_Main_Menu);	