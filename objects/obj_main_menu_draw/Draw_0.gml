if time > 120 {
	var t = 255 * abs(dsin(time)) ;
	draw_set_color(make_color_hsv(t,255,255));
	draw_set_font(fnt_mono);
	draw_set_halign(fa_center);
	draw_text_transformed(320,100,"Undertale Engine",2,2,0);
}
if time > 220 {
	draw_set_font(fnt_mono);
	draw_set_halign(fa_center);
		if menu_choice == 0 {
			draw_set_color(c_yellow);
		}else {
			draw_set_color(c_white);
		}
		draw_text_transformed(320,290,"开始游戏",1.2,1.2,0)
		if menu_choice == 1 {
			draw_set_color(c_yellow);
		}else {
			draw_set_color(c_white);
		}
		draw_text_transformed(320,340,"游戏设置",1.2,1.2,0)//文字
	draw_set_halign(fa_left);
	
	//光线
	draw_sprite_ext(spr_menu_light,0,0,0,1,1,0,c_white,sin(degtorad(time)));
	
	draw_set_color(c_white);
	draw_text_transformed(440,220,"By Black_Hurricane",0.75,0.75,0);
}