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


//不在动画中或动画大于一半时
if anim_choice_time == 0 or anim_choice_time <= floor(anim_choice_time_max / 2){
    getChoice();
}



if time >= 260 {
	draw_set_font(GetLangFont());
    draw_set_valign(fa_middle);

    if time == 260 {
        draw_set_color(c_white);
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
    //触发过渡动画
    if anim_choice_time > 0 and anim_out == false{
        if anim_choice_time == anim_choice_time_max{
            bma1 = CreateAnim().add(anim_choice_time_max,0,1).anim(ac_mainmenu_choice_alpha).execute(function(t){         
                draw_set_alpha(t);
            })
            //过渡动画 220->250->190->220
            bmm1 = CreateAnim().add(anim_choice_time_max,220,250).anim(ac_mainmenu_choice_move).execute(function(t){     
                if menu_choice == 0 draw_set_color(c_yellow);    
                var scale = choice_arr[0].size;
                draw_text_transformed(110,t,choice_arr[0].text,scale,scale,0)
                draw_set_color(c_white);
            })
            bmm2 = CreateAnim().add(anim_choice_time_max,280,310).anim(ac_mainmenu_choice_move).execute(function(t){  
                if menu_choice == 1 draw_set_color(c_yellow);       
                var scale = choice_arr[1].size;
                draw_text_transformed(90,t,choice_arr[1].text,scale,scale,0)
                draw_set_color(c_white);
            })
            bmm3 = CreateAnim().add(anim_choice_time_max,340,370).anim(ac_mainmenu_choice_move).execute(function(t){        
                if menu_choice == 2 draw_set_color(c_yellow); 
                var scale = choice_arr[2].size;
                draw_text_transformed(70,t,choice_arr[2].text,scale,scale,0)
                draw_set_color(c_white);
            })
        }
        bma1.run();
        bmm1.run();
        bmm2.run();
        bmm3.run();
        bm3.finish();
        bm4.finish();
        bm5.finish();
        draw_set_alpha(1);
        anim_choice_time--;
    }


    //运行动画 在非动画情况下运行
    if anim_choice_time == 0{
        bm3.run();
        bm4.run();
        bm5.run();
        bm6.run();
    }
    draw_set_valign(fa_top);
}

