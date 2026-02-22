if action_index == 0 {
	Battle_Dialogue_Add(GetTranslationDetailed("basic_enemy_action1.1"));
	Battle_Dialogue_Add(GetTranslationDetailed("basic_enemy_action1.2"));
}else if action_index == 1 {
	Battle_Dialogue_Add(GetTranslationDetailed("basic_enemy_action2.1"));
	mercy -= 10;
}else if action_index == 2 {
	Battle_Dialogue_Add(GetTranslationDetailed("basic_enemy_action3.1"));
	mercy += 10;
}else if action_index == 3 {
	Battle_Dialogue_Add(GetTranslationDetailed("basic_enemy_action4.1"));
	Battle_Dialogue_Add(GetTranslationDetailed("basic_enemy_action4.2"));
	Battle_Dialogue_Add(GetTranslationDetailed("basic_enemy_action4.3"));
	mercy += 15;
}