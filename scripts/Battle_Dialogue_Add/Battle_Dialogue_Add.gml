function Battle_Dialogue_Add(_string){
	//obj_battle.battle_ui_dialogue = CreateText(80,280,DEPTH.UI_TOP,"* " + _string,_color,_font){
	//	obj_battle.battle_ui_dialogue.can_destroy = true;
	//}
	ds_queue_enqueue(global._battle_dialogue,_string);
}