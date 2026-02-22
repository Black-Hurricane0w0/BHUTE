enemy_name = "test_enemy_name";
hp = 10000000;
defense = 80;
attack_damage = 1;
max_hp = 10000000;
miss = false;
enemy_id = id;
action = ["test_enemy_action_check","test_enemy_action_test1","test_enemy_action_test2","test_enemy_action_test3","test_enemy_action_test4","test_enemy_action_test5","test_enemy_action_test6"]
action_index = -1;
mercy = 0;
turn = 0;
turn_max_time = infinity;
obj_battle.battle_state = BATTLE_STATE.ENEMY;
obj_battle.ui_enable = true;
obj_battle.buttom_enable = true;
enemy = -1;
time = 0;
Battle_TurnSet(obj_test);
Battle_TurnSetTime(turn_max_time);
//创建dsmap
Enemy_Infor_Init("enemy_name",enemy_name);
Enemy_Infor_Init("hp",hp);
Enemy_Infor_Init("defense",defense);
Enemy_Infor_Init("attack_damage",attack_damage);
Enemy_Infor_Init("max_hp",max_hp);
Enemy_Infor_Init("miss",miss);
Enemy_Infor_Init("id",enemy_id);

File_Set(PLAYER_INFO.DAMAGE,30244120);

