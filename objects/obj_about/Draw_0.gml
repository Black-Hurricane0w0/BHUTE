draw_set_font(GetLangFont());
draw_set_color(c_white);
draw_set_valign(fa_middle);
if time == 1 {
    bm = CreateAnim().add(30,0,1).anim(ac_speeddown);
    bm2 = CreateAnim().add(30,640 + 120,120 + 280).anim(ac_speeddown);
};
bm.run();
bm2.run();
draw_text_transformed(bm2.value,100,"Toby Fox",1,1,0);
draw_text_transformed(bm2.value,160,"Black Hurricane",1,1,0);
draw_text_transformed(bm2.value,220,"Author",1,1,0);


var aboutlist = [GetTranslationDetailed("ui.original_author"),GetTranslationDetailed("ui.template_author"),GetTranslationDetailed("ui.au_author"),GetTranslationDetailed("ui.donation"),GetTranslationDetailed("ui.credits")]
for (var i = 0; i < array_length(aboutlist); i++) { 
    draw_set_color(c_white);
    var size = aboutlist[i].size;
    var textlen = string_width(aboutlist[i].text) * size * (1 - bm.value);
    draw_text_transformed(90 * bm.value - textlen,100 + i * 60,aboutlist[i].text,size,size,0); 
}

draw_set_color(c_white);
draw_set_valign(fa_top);

