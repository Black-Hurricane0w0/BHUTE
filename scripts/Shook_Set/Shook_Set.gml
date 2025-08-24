function Shook_Set(shook){
	if Setting_Read(real,"Vibration") == true {
		global.shook = shook;
		return true;
	}else {
		return false;
	}
}