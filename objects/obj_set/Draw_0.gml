if debug = true {
	draw_set_color(c_white);
	draw_set_font(fnt_mars_nc);
	draw_set_halign(fa_left);
	var text = "FPS:" + string(fps) + " | " + string(fps_real);
	text += "\n" + string("x:" + string(mouse_x) + " y:" + string(mouse_y));
	draw_text_transformed(10,10,text,0.5,0.5,0);
	draw_set_halign(fa_right)
	draw_text_color(630,10,"DEBUG",c_red,c_white,c_blue,c_purple,1);
	draw_set_halign(fa_left);
}
