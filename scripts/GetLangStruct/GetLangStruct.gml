/// @desc 返回一个翻译结构体
/// @param {string} text 文本
/// @param {GMFont} [font]=global.lang_map[$font] 字体
/// @param {real} [size]=global.lang_map[$size] 大小
/// @returns {struct} Description
function GetLangStruct(text,font = global.lang_map[$"font"],size = global.lang_map[$"size"]){
    return {
        text : text,
        font : font,
        size : size
    }
}