function Input_lnit(){
	global._input_map = ds_map_create()//日常创ds
	
	enum INPUT{
		CONFIRM,
		BACK,
		MENU,
		UP,
		DOWN,
		LEFT,
		RIGHT
	}
	
	enum INPUT_STEAT{
		KEEP,
		PRESSED,
		RELEASED,
		NULL
	}
}