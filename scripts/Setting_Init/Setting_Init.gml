function Setting_Init(){
	ini_open("setting");
	if not ini_key_exists("setting","Vibration") {
        ini_write_real("setting","Vibration",true);
	}	
	if not ini_key_exists("setting","Volume") {
		ini_write_real("setting","Volume",100);
	}
	if not ini_key_exists("setting","Raining") {
		ini_write_real("setting","Raining",true);
	}
    if not ini_key_exists("setting","Lightning") {
		ini_write_real("setting","Lightning",true);
	}
	if not ini_key_exists("setting","Music") {
		ini_write_real("setting","Music",true);
	}
	if not ini_key_exists("setting","Music Volume") {
		ini_write_real("setting","Music Volume",100);
	}
	if not ini_key_exists("setting","Sound Effect Volume") {
		ini_write_real("setting","Sound Effect Volume",100);
	}
	if not ini_key_exists("setting","Full Screen Startup") {
		ini_write_real("setting","Full Screen Startup",false);
	}
    var lang = os_get_language();
    if !array_contains(global.language_list,lang) lang = "en";
	if not ini_key_exists("setting","Language") {
		ini_write_string("setting","Language",lang);
	}
    ini_close();
}