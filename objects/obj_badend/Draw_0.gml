if time >= 180 {
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_font(fnt_mars_nc)
	draw_text_transformed(320,100,"GAMEOVER",4,4,0);
}
draw_set_halign(fa_center);
draw_set_color(c_gray);
draw_text_transformed(320,400,"Press the \"F2\" to enter",0.5,0.5,0);