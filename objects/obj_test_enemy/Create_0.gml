enemy_name = "Test Enemy";
hp = 10000000;
protection = 80;
attack_damage = 1;
max_hp = 10000000;
miss = false;
enemy_id = id;
change_dialogue = false;
action = ["Check","Test1","Test2","Test3","Test4","Test5","Test6"]
action_index = -1;
mercy = 0;
fast_die = true;
turn = 0;
turn_max_time = infinity;
start_state = BATTLE_STATE.PLAYER;
obj_battle.ui_enable = true;
obj_battle.buttom_enable = true;
enemy = -1;

Battle_TurnSet(obj_test);
Battle_TurnSetTime(turn_max_time);
//创建dsmap
Enemy_Infor_Init("enemy_name",enemy_name);
Enemy_Infor_Init("hp",hp);
Enemy_Infor_Init("protection",protection);
Enemy_Infor_Init("attack_damage",attack_damage);
Enemy_Infor_Init("max_hp",max_hp);
Enemy_Infor_Init("miss",miss);
Enemy_Infor_Init("id",enemy_id);
Enemy_Infor_Init("start_state",start_state);

File_Set(PLAYER_INFO.DAMAGE,30244120);

