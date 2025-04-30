function Shook_Set(shook){
	if Setting_Read(string,"Vibration") == true {
		global.shook = shook;
		return true;
	}else {
		return false;
	}
}