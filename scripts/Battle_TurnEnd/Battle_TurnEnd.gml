/// @desc 结束本回合的战斗
function Battle_TurnEnd(){
	if obj_battle.battle_state == BATTLE_STATE.ENEMY{
        log("Turn " + object_get_name(obj_battle.turn_inst) + " End...");
		obj_battle.battle_state = BATTLE_STATE.PLAYER;
		obj_battle.battle_buttom_state = MENU.BUTTOM_CHOICE;
		obj_battle.turn_time = Enemy_Infor_Get("id",0).turn_max_time;
        instance_activate_object(obj_soul);
        obj_soul.x = File_Get(PLAYER_INFO.X);
        obj_soul.y = File_Get(PLAYER_INFO.Y);
		Enemy_Infor_Get("id",0).turn ++;
		instance_activate_object(obj_soul);
		with(obj_battle.turn_inst){
			instance_destroy(self);
		}
        ArenaClearAddition();
	}
}