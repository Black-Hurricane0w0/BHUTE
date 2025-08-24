function Setting_Init(){
	ini_open("setting");
	if not ini_key_exists("setting","Vibration") {
		Setting_Write("Vibration",true);
	}	
	ini_open("setting");
	if not ini_key_exists("setting","Volume") {
		Setting_Write("Volume",100);
	}
	ini_open("setting");
	if not ini_key_exists("setting","Raining") {
		Setting_Write("Raining",true);
	}
	ini_open("setting");
	if not ini_key_exists("setting","Lightning") {
		Setting_Write("Lightning",true);
	}
	ini_open("setting");
	if not ini_key_exists("setting","Music") {
		Setting_Write("Music",true);
	}
	ini_open("setting");
	if not ini_key_exists("setting","Music Volume") {
		Setting_Write("Music Volume",100);
	}
	ini_open("setting");
	if not ini_key_exists("setting","Sound Effect Volume") {
		Setting_Write("Sound Effect Volume",100);
	}
    ini_open("setting");
	if not ini_key_exists("setting","Full Screen Startup") {
		Setting_Write("Full Screen Startup",false);
	}
    ini_open("setting");
	if not ini_key_exists("setting","Language") {
		Setting_Write("Language","en");
	}
    ini_close();
}