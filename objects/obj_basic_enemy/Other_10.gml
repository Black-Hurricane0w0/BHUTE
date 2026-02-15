if action_index == 0 {
	Battle_Dialogue_Add("BASIC ENEMY 1 ATK 0 DEF");
	Battle_Dialogue_Add("It is just a testing tool.");
}else if action_index == 1 {
	Battle_Dialogue_Add("What did you do!");
	mercy -= 10;
}else if action_index == 2 {
	Battle_Dialogue_Add("Emm......So delicious.");
	mercy += 10;
}else if action_index == 3 {
	Battle_Dialogue_Add("You fell asleep peacefully.");
	Battle_Dialogue_Add("So bad!");
	Battle_Dialogue_Add("Oh,you were startled awake!");
	mercy += 15;
}