/// @desc 写入设置信息
/// @param {string} key 写入的设置
/// @param {string} value 写入的信息
function Setting_Write(key,value){
	ini_open("setting");
	ini_write_string("setting",key,value)
	ini_close();
}