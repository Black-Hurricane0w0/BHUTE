time ++;



if text_func != undefined {
    text_func();
    exit;
}
if text != "&" {
    var res = pos;
    if random(100) < 0.5 {
        var offest = choose(new vec2(1,0),new vec2(-1,0),new vec2(0,1),new vec2(0,-1));
        res = pos.add(offest);
    }
	draw_set_color(text_color);
	draw_set_font(text_font);
	if text == "^" {
		var str = ansi_char(random_range(50,100));
		draw_text_transformed(res.x,res.y,str,text_size,text_size,0);
	}else {
		draw_text_transformed(res.x,res.y,text,text_size,text_size,0);
	}
}


