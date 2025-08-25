if hp <= 0 and turn != -1 {
	Enemy_Dialogue_Add(GetTranslation("enemy_dialogue.1"));
	if Enemy_Number() <= 1 {
        turn = -1;
    }else{
        Enemy_Remove(enemy);
    }
}