function ReadLang(){
    var lang = Setting_Read(string,"Language");
    var txt = file_text_open_read(lang + ".json");
    global.lang_map = json_parse(file_text_read_string(txt));
}