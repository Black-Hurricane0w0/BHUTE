enemy_name = "Basic Enemy";
hp = 100;
protection = 0;
attack_damage = 1;
max_hp = 100;
miss = false;
enemy_id = id;
change_dialogue = false;
action = ["Check","Fuck","Eat","Sleep"]
action_index = -1;
mercy = 0;
fast_die = true;
turn = 0;
turn_max_time = 600;
start_state = BATTLE_STATE.PLAYER;
obj_battle.ui_enable = true;
obj_battle.buttom_enable = true;

Battle_TurnSet(obj_turn);
Battle_TurnSetTime(turn_max_time);
//创建dsmap
Enemy_Infor_Set("enemy_name",enemy_name);
Enemy_Infor_Set("hp",hp);
Enemy_Infor_Set("protection",protection);
Enemy_Infor_Set("attack_damage",attack_damage);
Enemy_Infor_Set("max_hp",max_hp);
Enemy_Infor_Set("miss",miss);
Enemy_Infor_Set("id",enemy_id);
Enemy_Infor_Set("start_state",start_state);

Enemy_Dialogue_Add("Hello!");
Enemy_Dialogue_Add("Do you want to play with me?");