/**
 * @function GetTranslationDetailed
 * @description 返回翻译结构体信息，包含文本、字体和大小
 * @param {string} _string 翻译的键（在语言文件中定义）
 * @returns {struct} 返回的翻译结构体
 * 翻译结构体包含text（文本）、font（字体）和size（大小）属性
 * 如果翻译键不存在，会显示错误信息
 * 如果翻译值是字符串，会自动创建包含默认字体和大小的结构体
 * 如果翻译值是结构体，但缺少某些属性，会自动补充默认值
 */
function GetTranslationDetailed(_string){
    var res = global.lang_map[$_string];
    var defont = global.lang_map[$"font"] 
    var desize = global.lang_map[$"size"]
    if res == undefined {
        show_error("GetTranslationDetailed() unable to find a suitable key value pair",false);
    } else{
        if is_string(res){
            return {
                text : res,
                font : defont,
                size : desize
            }
        }else if is_struct(res){
            if !variable_struct_exists(res,"text") {
                show_error("GetTranslationDetailed() lack of necessary variables",false);
            }
            if !variable_struct_exists(res,"font") {
                variable_struct_set(res,"font",global.lang_map[$"font"])
            }
            if !variable_struct_exists(res,"size") {
                variable_struct_set(res,"size",global.lang_map[$"size"])
            }
            return res;
        }
    }
}