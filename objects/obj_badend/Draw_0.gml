if time >= 180 {
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_font(fnt_mars_nc)
	draw_text_transformed(320,100,"GAMEOVER",4,4,0);
}
draw_set_font(fnt_mars_nc)
draw_set_halign(fa_center);
draw_set_color(c_gray);
if gamepad_is_connected(0){
    draw_text_transformed(320,400,"Press the \"Y\" to replay",0.5,0.5,0);
}else{
    draw_text_transformed(320,400,"Press the \"F2\" to replay",0.5,0.5,0);
}
