if time > 120 and time < 220 {
    draw_sprite_ext(spr_main_logo,0,320,200,2,2,0,c_white,1);
}
if time >= 220 {
    if time == 220 {
        //标题动画
        bm = CreateAnim().add(31,[320,240,2],[180,100,1]).anim(ac_speeddown).execute(function(t){
            draw_sprite_ext(spr_main_logo,0,t[0],t[1],t[2],t[2],0,c_white,1);
        })
        audio_play_sound(snd_create,false,false);
    }
    bm.run();
}



if time >= 260 {
	draw_set_font(fnt_mono);
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    if time == 260 {
        //标题动画
        bm3 = CreateAnim().add(30,-30,170).anim(ac_speeddown).execute(function(t){
            if menu_choice == 0 draw_set_color(c_yellow);
            draw_text_transformed(t,220,"开始游戏",1,1,0)
            draw_set_color(c_white);
        })
        main_line = layer_sequence_create("seq",320,240,seq_main_line);
        bm4 = CreateAnim();
        bm5 = CreateAnim();
        bm6 = CreateAnim();
    }
    if time == 275 {
        //标题动画
        bm4 = CreateAnim().add(30,-30,150).anim(ac_speeddown).execute(function(t){
            if menu_choice == 1 draw_set_color(c_yellow);
            draw_text_transformed(t,280,"游戏设置",1,1,0);
            draw_set_color(c_white);
        })
    }
    if time == 290 {
        //标题动画
        bm5 = CreateAnim().add(30,-30,130).anim(ac_speeddown).execute(function(t){
            if menu_choice == 2 draw_set_color(c_yellow);
            draw_text_transformed(t,340,"关于我们",1,1,0);
            draw_set_color(c_white);
        })
        instance_create_depth(-300,200,DEPTH.SOUL,obj_soul);
        bm6 = CreateAnim().add(30,0,1).anim(ac_speeddown).execute(function(t){
            layer_sprite_alpha(background,t);
        })
    }
    bm3.run();
    bm4.run();
    bm5.run();
    bm6.run();
	draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

