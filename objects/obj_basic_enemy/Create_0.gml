enemy_name = "Basic Enemy";
hp = 100;
defense = 0;
attack_damage = 1;
max_hp = 100;
miss = false;
enemy_id = id;
action = ["Check","Fuck","Eat","Sleep"]
action_index = -1;
mercy = 0
turn = 0;
turn_max_time = 600;
obj_battle.battle_state = BATTLE_STATE.PLAYER;
obj_battle.ui_enable = true;
obj_battle.buttom_enable = true;
enemy = -1;

Battle_TurnSet(obj_turn);
Battle_TurnSetTime(turn_max_time);
//创建dsmap
Enemy_Infor_Init("enemy_name",enemy_name);
Enemy_Infor_Init("hp",hp);
Enemy_Infor_Init("defense",defense);
Enemy_Infor_Init("attack_damage",attack_damage);
Enemy_Infor_Init("max_hp",max_hp);
Enemy_Infor_Init("miss",miss);
Enemy_Infor_Init("id",enemy_id);

Enemy_Dialogue_Add("你好^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");