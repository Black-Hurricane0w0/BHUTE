/// @desc 保存语言文件，可在此处写入翻译，仅在debug模式下运行
function SaveLang(){
    if obj_set.debug == false exit;
    var en = {
        "language" : "en",
        "font" : fnt_mono,
        "size" : 1,
        "ui.start_game" : "Start game",
        "ui.language" : "Language",
        "ui.music" : "Music",
        "ui.setting" : "Setting",
        "ui.about_us" : "About us",
        "ui.volume" : "Volume",
        "ui.raining" : "Raining",
        "ui.lightning" : "Lightning",
        "ui.music_volume" : "Music Volume",
        "ui.sound_effect_volume" : {
            text : "Sound Effect Volume",
            size : 0.8
        },
        "ui.full_screen_startup" : {
            text : "Full Screen Startup",
            size : 0.8
        },
        "ui.enable" : "Enable",
        "ui.disable" : "Disable",
        "dialogue.1" : " You feel like you're going to&  have a bad time",
        "enemy_dialogue.1" : "All right......&You win.",
        "enemy_action1.1" : "SANS 1 ATK 1 DEF&* The easiest enemy.&* Can only deal 1 damage.",
        "enemy_action1.2" : "It is used to test you.",
        "enemy_action_dial1.1" : "Do you see this heart? This is your soul, the essence of your&life!",
        "ui.original_author" : "Original Author",
        "ui.template_author" : "Template Author",
        "ui.au_author" : "AU Author",
        "ui.donation" : "Donate Author",
        "ui.credits" : "Credits",
        "ui.phase_1" : "Phase One",
        "ui.phase_2" : "Phase Two",
        "ui.phase_3" : "Phase Three"
    };
    var entxt = file_text_open_write("en.json");
    file_text_write_string(entxt,json_stringify(en))
    file_text_close(entxt);
    
    var zh = {
        "language" : "zh",
        "font" : fnt_chinese,
        "size" : 1,
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
        "dialogue.1" : "你感觉你将度过一段糟糕的时光",
        "enemy_dialogue.1" : "好吧......&你赢了.",
        "enemy_action1.1" : "SANS 1攻击 1防御&* 最简单的敌人&* 只能造成1点伤害",
        "enemy_action1.2" : "测试用的东西",
        "enemy_action_dial1.1" : "看见这颗心了吗？这是你的灵魂，是你生命的精华所在！",
        "ui.original_author" : "原作作者",
        "ui.template_author" : "模板作者",
        "ui.au_author" : "AU作者",
        "ui.donation" : "捐赠作者",
        "ui.credits" : "贡献名单",
        "ui.phase_1" : "第一阶段",
        "ui.phase_2" : "第二阶段",
        "ui.phase_3" : "最终阶段"
    };
    var zhtxt = file_text_open_write("zh.json");
    file_text_write_string(zhtxt,json_stringify(zh))
    file_text_close(zhtxt);
}