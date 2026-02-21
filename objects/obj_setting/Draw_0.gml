
draw_set_font(GetLangFont());
draw_set_color(c_white);
draw_set_valign(fa_middle);
if time == 1 {
    bm = CreateAnim().add(30,0,1).anim(ac_speeddown);
    bm2 = CreateAnim().add(30,640 + 150,120 + 350).anim(ac_speeddown);
};
bm.run();
bm2.run();
draw_text_transformed(bm2.value + 30,100,string(Setting_Read("real","Volume")) + "%" ,1,1,0);
draw_healthbar(bm2.value - 80,95,bm2.value,107,Setting_Read("real","Volume"),c_black,c_white,c_white,0,false,true);
draw_text_transformed(bm2.value,160,Setting_Read("real","Raining")?GetTranslation("ui.enable"):GetTranslation("ui.disable"),1,1,0);
draw_text_transformed(bm2.value,220,Setting_Read("real","Lightning")?GetTranslation("ui.enable"):GetTranslation("ui.disable"),1,1,0);
draw_text_transformed(bm2.value,280,Setting_Read("real","Music")?GetTranslation("ui.enable"):GetTranslation("ui.disable"),1,1,0);
draw_text_transformed(bm2.value + 30,340,string(Setting_Read("real","Music Volume")) + "%",1,1,0);
draw_healthbar(bm2.value - 80,340-5,bm2.value,340+7,Setting_Read("real","Music Volume"),c_black,c_white,c_white,0,false,true);
draw_text_transformed(bm2.value + 30,400,string(Setting_Read("real","Sound Effect Volume")) + "%",1,1,0);
draw_healthbar(bm2.value - 80,400-5,bm2.value,400+7,Setting_Read("real","Sound Effect Volume"),c_black,c_white,c_white,0,false,true);
draw_text_transformed(bm2.value,460,Setting_Read("real","Full Screen Startup")?GetTranslation("ui.enable"):GetTranslation("ui.disable"),1,1,0);
var language = [];
for (var i = 0; i < array_length(global.language_list); i++) {
    var lang = Setting_Read("string","Language");
    var txt = file_text_open_read(lang + ".json");
    global.lang_map = json_parse(file_text_read_string(txt));
    var langtext =  global.lang_map[$"language_name"];
    file_text_close(txt);
	array_push(language,langtext);
}

var index = array_get_index(global.language_list,Setting_Read("string","Language"));
draw_text_transformed(bm2.value,520,language[index],1,1,0);


var settinglist = [GetTranslationDetailed("ui.volume"),GetTranslationDetailed("ui.raining"),GetTranslationDetailed("ui.lightning"),GetTranslationDetailed("ui.music"),GetTranslationDetailed("ui.music_volume"),GetTranslationDetailed("ui.sound_effect_volume"),GetTranslationDetailed("ui.full_screen_startup"),GetTranslationDetailed("ui.language")]
for (var i = 0; i < array_length(settinglist); i++) { 
    draw_set_color(c_white);
    if setting_choice == i and detailed_setting == false {
        draw_set_color(c_yellow)
    }
    var size = settinglist[i].size;
    var textlen = string_width(settinglist[i].text) * size * (1 - bm.value);
    draw_text_transformed(120 * bm.value - textlen,100 + i * 60,settinglist[i].text,size,size,0); 
}

draw_set_color(c_white);
draw_set_valign(fa_top);

