

hp = Enemy_Infor_Get("hp",enemy);

if hp <= 0 and turn != -1 {
	Enemy_Dialogue_Add(GetLangStruct("All right,you win."));
	if Enemy_Number() <= 1 {
        turn = -1;
    }
    Enemy_Remove(enemy);
}

