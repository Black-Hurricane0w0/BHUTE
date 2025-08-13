

//if enemy == -1 exit;
hp = Enemy_Infor_Get("hp",enemy);

if hp <= 0 and turn != -1 {
	Enemy_Dialogue_Add("All,right......&You win.");
	turn = -1;
}