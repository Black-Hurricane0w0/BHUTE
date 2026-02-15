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
            name : GetTranslationDetailed("ui.first_phase")
        },
        c1 : {
            name : GetTranslationDetailed("ui.second_phase")
        },
        c2 : {
            name : GetTranslationDetailed("ui.final_phase")
        }
    },
    c1 : {
        name : GetTranslationDetailed("ui.setting")
    },
    c2 : {
        name : GetTranslationDetailed("ui.about_us")
    }
}
choice_layer = "";//当前菜单层 格式如：012表示c0->c1->c2
anim_choice_time = 0;//过渡动画时间
anim_choice_time_max = 30;//最大过渡动画时间
