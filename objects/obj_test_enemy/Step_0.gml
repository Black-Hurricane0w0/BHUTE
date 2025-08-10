

hp = Enemy_Infor_Get("hp");

if hp <= 0 and turn != -1 {
	Enemy_Dialogue_Add("All,right......&You win.");
	turn = -1;
}