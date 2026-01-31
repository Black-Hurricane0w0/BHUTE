if debug = true {
	draw_set_color(c_white);
	draw_set_font(fnt_mars_nc);
	draw_set_halign(fa_left);
	var text = "FPS:" + string(fps) + " | " + string(fps_real);
	text += "\n" + "x:" + string(mouse_x) + " y:" + string(mouse_y);
    var pixel = surface_getpixel_ext(application_surface,floor(mouse_x),floor(mouse_y));
    var mr = (pixel & 255)/255;
    var mg = ((pixel>>8) & 255)/255;
    var mb = ((pixel>>16) & 255)/255;
    var ma = ((pixel>>24) & 255)/255;
    text += "\n" + string("rgba={0},{1},{2},{3}",round(mr*255),round(mg*255),(mb*255),(ma*255));
    text += "\nversion:" + string(version);
    text += "\nRoom:" + string(room);
    text += "\nCamera:" + "x:" + string(global.camera_x) + "y:" + string(global.camera_y);
    text += "\nKR:" + (global.kr_enable?"true":"false");
	draw_text_transformed(10 + global.camera_x,10 + global.camera_y,text,0.5,0.5,0);
	draw_set_halign(fa_right)
	draw_text_color(630 + global.camera_x,10 + global.camera_y,"DEBUG",c_red,c_white,c_blue,c_purple,1);
	draw_set_halign(fa_left);
}









