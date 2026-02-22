if action_index == 0 {
	Battle_Dialogue_Add(GetTranslation("test_enemy_action1.1"));
	Battle_Dialogue_Add(GetTranslation("test_enemy_action1.2"));
    Enemy_Dialogue_Add(GetTranslation("test_enemy_action_dial1.1"))
}
if action_index == 1 {
	Battle_Dialogue_Add(GetTranslation("test_enemy_action1.2"));
    mercy += 80;
}
if action_index == 2 {
	Battle_Dialogue_Add(GetTranslation("test_enemy_action3.1"));
}