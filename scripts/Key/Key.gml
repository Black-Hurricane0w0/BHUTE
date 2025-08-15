function Key(){
	//绑键
	Input_Set(INPUT.CONFIRM,ord("Z"));
	Input_Set(INPUT.BACK,ord("X"));
	Input_Set(INPUT.MENU,ord("C"));
	Input_Set(INPUT.UP,vk_up);
	Input_Set(INPUT.DOWN,vk_down);
	Input_Set(INPUT.LEFT,vk_left);
	Input_Set(INPUT.RIGHT,vk_right);
	keyboard_set_map(vk_enter,ord("Z"));
	keyboard_set_map(vk_shift,ord("X"));
	
	//如果有游戏手柄
	if gamepad_is_connected(0) {
		Input_Set(INPUT.CONFIRM,gp_face1);
		Input_Set(INPUT.BACK,gp_face2);
		Input_Set(INPUT.MENU,gp_face4);
		Input_Set(INPUT.UP,gp_padu);
		Input_Set(INPUT.DOWN,gp_padd);
		Input_Set(INPUT.LEFT,gp_padl);
		Input_Set(INPUT.RIGHT,gp_padr);
	}
}