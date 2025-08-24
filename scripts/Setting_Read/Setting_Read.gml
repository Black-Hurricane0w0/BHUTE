function Setting_Read(kind,key){
	ini_open("setting");
	if kind == string {
		var result = ini_read_string("setting",key,"")
	}else if kind == real {
		var result = ini_read_real("setting",key,100);
	}
	ini_close();
	return result;
}