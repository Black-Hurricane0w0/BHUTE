function GetTranslation(_string){
    var res = global.lang_map[$_string];
    if res == undefined {
        show_error("GetTranslation() unable to find a suitable key value pair",false);
    } else{
        return res
    }
}