/// @desc 初始化输入系统
function Input_lnit(){
	global._input_map = ds_map_create()
	
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
    log("Input system loaded...")
}