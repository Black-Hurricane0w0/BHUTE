/// @desc 返回翻译结构体信息
/// @param {string} _string 翻译的键
/// @return {Struct} 返回的翻译结构体
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