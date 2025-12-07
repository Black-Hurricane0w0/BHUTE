/// @desc 读取设置信息
/// @param {string} kind 读取模式（“real”/“string”）
/// @param {string} key 读取信息
function Setting_Read(kind,key){
	ini_open("setting");
    var result = -1;
	if kind == "string" {
		result = ini_read_string("setting",key,"")
	}else if kind == "real" {
		result = ini_read_real("setting",key,100);
	}
	ini_close();
	return result;
}