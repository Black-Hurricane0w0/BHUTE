/// @desc 创建一个文本对象
/// @param {real} x x位置
/// @param {real} y y位置
/// @param {real} depth 文本深度
/// @param {string} text 文本内容
/// @param {constant.color} [color]=c_white 文本颜色
/// @param {asset.gmfont} [font]=fnt_mono 文本字体
/// @param {real} [size]=1 文本大小
/// @param {real} [_speed]=2 文本播放速度
/// @param {asset.gmsound} [snd]=snd_text_sound 文本播放声音
/// @param {bool} [candestory]=false 是否能被按键跳过
/// @returns {Instance.id} 文本对象id
function CreateText(x,y,depth,text,color = c_white,font = GetLangFont(),size = 1,_speed = 2,snd = snd_text_sound,candestory = false){
	var text_inst = instance_create_depth(x,y,depth,obj_text);//创建并接受id
	text_inst.text = text;//传递
	text_inst.text_color = color;
	text_inst.text_font = font;
	text_inst.text_size = size;
	text_inst.text_speed = _speed;
	text_inst.text_snd = snd;
	text_inst.can_destroy = candestory;
	return text_inst
}

/// @desc 使用翻译结构体创建一个文本对象
/// @param {real} x x位置
/// @param {real} y y位置
/// @param {real} depth 文本深度
/// @param {struct} struct 翻译结构体
/// @param {constant.color} [color]=c_white 文本颜色
/// @param {real} [_speed]=2 文本播放速度
/// @param {asset.gmsound} [snd]=snd_text_sound 文本播放声音
/// @param {bool} [candestory]=false 是否能被按键跳过
/// @returns {Instance.id} 文本对象id
function CreateLangText(x,y,depth,struct,color = c_white,_speed = 2,snd = snd_text_sound,candestory = false){
	var text_inst = instance_create_depth(x,y,depth,obj_text);//创建并接受id
	text_inst.text = struct.text;//传递
	text_inst.text_color = color;
	text_inst.text_font = struct.font;
	text_inst.text_size = struct.size;
	text_inst.text_speed = _speed;
	text_inst.text_snd = snd;
	text_inst.can_destroy = candestory;
	return text_inst
}

/**
 * 创建一个自定义文本对象
 * @param {real} x x位置
 * @param {real} y y位置
 * @param {string} text 文本内容
 * @param {bool} [candestory]=false 是否能被按键跳过
 * @param {Function} [func] 每个文本字符所应用的函数
 * @returns {Instance.id}
 */
function CreateFuncText(x,y,text,candestory = false,func = undefined){
	var text_inst = instance_create_depth(x,y,DEPTH.UI_TOP,obj_text);//创建并接受id
	text_inst.text = text;
	text_inst.can_destroy = candestory;
    text_inst.text_func = func;
	return text_inst
}

/**
 * 使用翻译结构体创建一个自定义文本对象
 * @param {real} x x位置
 * @param {real} y y位置
 * @param {struct} struct 翻译结构体
 * @param {bool} [candestory]=false 是否能被按键跳过
 * @param {Function} [func] 每个文本字符所应用的函数
 * @returns {Instance.id}
 */
function CreateLangFuncText(x,y,struct,candestory = false,func = undefined){
	var text_inst = instance_create_depth(x,y,DEPTH.UI_TOP,obj_text);//创建并接受id
	text_inst.text = struct.text;
    text_inst.text_font = struct.font;
    text_inst.text_size = struct.size;
	text_inst.can_destroy = candestory;
    text_inst.text_func = func;
	return text_inst
}