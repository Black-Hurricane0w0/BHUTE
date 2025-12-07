/// @desc 获得翻译对应文本
/// @param {string} _string 翻译的键
function GetTranslation(_string){
    var res = global.lang_map[$_string];
    if res == undefined {
        show_error("GetTranslation() unable to find a suitable key value pair",false);
    } else{
        if is_string(res){
            return res
        }else if is_struct(res){
            if !variable_struct_exists(res,"text") {
                show_error("GetTranslationDetailed() lack of necessary variables",false);
            }
            return res.text;
        }
    }
}