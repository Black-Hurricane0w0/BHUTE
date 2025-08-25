draw_set_font(fnt_mono);
draw_set_color(c_white);
draw_set_valign(fa_middle);
if time == 1 {
    bm = CreateAnim().add(30,-120,120).anim(ac_speeddown);
    bm2 = CreateAnim().add(30,640 + 120,120 + 280).anim(ac_speeddown);
};
bm.run();
bm2.run();
draw_text_transformed(bm2.value + 30,100,"Toby Fox",1,1,0);
draw_text_transformed(bm2.value + 30,160,"Black Hurricane",1,1,0);
draw_text_transformed(bm2.value + 30,220,"Author",1,1,0);


var settinglist = [GetTranslation("ui.original_author"),GetTranslation("ui.template_author"),GetTranslation("ui.au_author")]
for (var i = 0; i < array_length(settinglist); i++) { 
    draw_set_color(c_white);
    draw_text_transformed(bm.value,100 + i * 60,settinglist[i],1,1,0); 
}

draw_set_color(c_white);
draw_set_valign(fa_top);

