time = 0;
inst = noone;
fade = 0;
anim_out = false;
alpha = 0;
menu_choice = 0;
Blur_Init();
Glow_Init();
choice = {
    c0 : {
        name : GetTranslationDetailed("ui.start_game"),
        c0 : {
            name : GetLangStruct("第一阶段")
        },
        c1 : {
            name : GetLangStruct("第二阶段")
        },
        c2 : {
            name : GetLangStruct("最终阶段")
        }
    },
    c1 : {
        name : GetTranslationDetailed("ui.setting")
    },
    c2 : {
        name : GetTranslationDetailed("ui.about_us")
    }
}
choice_layer = "";
