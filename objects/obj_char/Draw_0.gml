
if text != "&" {
	draw_set_color(text_color);
	draw_set_font(text_font);
	if text == "^" {
		var str = ansi_char(random_range(50,100));
		draw_text_transformed(x,y,str,text_size,text_size,0);
	}else {
		draw_text_transformed(x,y,text,text_size,text_size,0);
	}
}

