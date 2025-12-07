/// @desc 生成一个翻译结构体并返回
/// @param {string} text 文本
/// @param {GMFont} [font]=global.lang_map[$font] 字体
/// @param {real} [size]=global.lang_map[$size] 大小
/// @returns {Struct} 返回的翻译结构体
function GetLangStruct(text,font = global.lang_map[$"font"],size = global.lang_map[$"size"]){
    return {
        text : text,
        font : font,
        size : size
    }
}