function Battle_TurnEnd(){
	if obj_battle.battle_state == BATTLE_STATE.ENEMY{
		obj_battle.battle_state = BATTLE_STATE.PLAYER;
		obj_battle.battle_buttom_state = MENU.BUTTOM_CHOICE;
		obj_battle.turn_time = Enemy_Infor_Get("id").turn_max_time;
		Enemy_Infor_Get("id").turn ++;
		instance_activate_object(obj_soul);
		with(obj_battle.turn_inst){
			instance_destroy(self);
		}
	}
}