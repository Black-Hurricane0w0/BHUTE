function Setting_Write(key,value){
	ini_open("setting");
	ini_write_string("setting",key,value)
	ini_close();
}