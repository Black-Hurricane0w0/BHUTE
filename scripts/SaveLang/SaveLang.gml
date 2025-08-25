function SaveLang(){
    if obj_set.debug == false exit;
    var en = {
        "language" : "en",
        "ui.start_game" : "Start game",
        "ui.language" : "Language",
        "ui.music" : "Music",
        "ui.setting" : "Setting",
        "ui.about_us" : "About us",
        "ui.volume" : "Volume",
        "ui.raining" : "Raining",
        "ui.lightning" : "Lightning",
        "ui.music_volume" : "Music Volume",
        "ui.sound_effect_volume" : "Sound Effect Volume",
        "ui.full_screen_startup" : "Full Screen Startup",
        "ui.enable" : "Enable",
        "ui.disable" : "Disable",
        "dialogue.1" : "Rain poured down",
        "enemy_dialogue.1" : "All right......&You win.",
        "enemy_action1.1" : "Name : Test Enemy&* HP : ^^^^^^^^&* Attack Damage : 22&* Protition : 80",
        "enemy_action1.2" : "It is used to test you.",
        "ui.original_author" : "Original Author",
        "ui.template_author" : "Template Author",
        "ui.au_author" : "AU Author"
    };
    var entxt = file_text_open_write("en.json");
    file_text_write_string(entxt,json_stringify(en))
    file_text_close(entxt);
    
    var zh = {
        "language" : "zh",
        "ui.start_game" : "开始游戏",
        "ui.language" : "语言",
        "ui.music" : "音乐",
        "ui.setting" : "游戏设置",
        "ui.about_us" : "关于我们",
        "ui.volume" : "总音量",
        "ui.raining" : "雨",
        "ui.lightning" : "闪电",
        "ui.music_volume" : "音乐音量",
        "ui.sound_effect_volume" : "音效音量",
        "ui.full_screen_startup" : "全屏启动",
        "ui.enable" : "启用",
        "ui.disable" : "禁用",
        "dialogue.1" : "大雨骤至",
        "enemy_dialogue.1" : "好吧......&你赢了.",
        "enemy_action1.1" : "姓名 : Test Enemy&* HP : ^^^^^^^^&* 伤害 : 22&* 护甲 : 80",
        "enemy_action1.2" : "测试用的东西",
        "ui.original_author" : "原作作者",
        "ui.template_author" : "模板作者",
        "ui.au_author" : "AU作者"
    };
    var zhtxt = file_text_open_write("zh.json");
    file_text_write_string(zhtxt,json_stringify(zh))
    file_text_close(zhtxt);
}