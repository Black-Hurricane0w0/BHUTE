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
//获取当前菜单列表
var choice_struct = choice;
for(var i = 0;i<string_length(choice_layer);i++){
    var str = "c"+ string_char_at(choice_layer,i + 1);
    choice_struct = choice_struct[$str];
}
choice_arr = [choice_struct.c0.name,choice_struct.c1.name,choice_struct.c2.name];


if time >= 260 {
	draw_set_font(GetLangFont());
    draw_set_valign(fa_middle);

    if time == 260 {
        //标题动画
        bm3 = CreateAnim().add(30,-30,110).anim(ac_speeddown).execute(function(t){
            if menu_choice == 0 draw_set_color(c_yellow);
                
            var scale = choice_arr[0].size;
            draw_text_transformed(t,220,choice_arr[0].text,scale,scale,0)
            draw_set_color(c_white);
        })
        main_line = layer_sequence_create("seq",320,240,seq_main_line);
        bm4 = CreateAnim();
        bm5 = CreateAnim();
        bm6 = CreateAnim();
    }
    if time == 275 {
        //标题动画
        bm4 = CreateAnim().add(30,-30,90).anim(ac_speeddown).execute(function(t){
            if menu_choice == 1 draw_set_color(c_yellow);
                
            var scale = choice_arr[1].size;
            draw_text_transformed(t,280,choice_arr[1].text,scale,scale,0);
            draw_set_color(c_white);
        })
    }
    if time == 290 {
        //标题动画
        bm5 = CreateAnim().add(30,-30,70).anim(ac_speeddown).execute(function(t){
            if menu_choice == 2 draw_set_color(c_yellow);
                
            var scale = choice_arr[2].size;
            draw_text_transformed(t,340,choice_arr[2].text,scale,scale,0);
            draw_set_color(c_white);
        })
        instance_create_depth(-300,200,DEPTH.SOUL,obj_soul);
        instance_create_layer(0,0,"Assets_1",obj_main_background);
        bm6 = CreateAnim().add(30,0,1).anim(ac_speeddown).execute(function(t){
            obj_main_background.alpha = t;
        })
    }
    bm3.run();
    bm4.run();
    bm5.run();
    bm6.run();
    draw_set_valign(fa_top);
}

