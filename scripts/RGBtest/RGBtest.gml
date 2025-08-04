function RGBtest(surface = application_surface,x = mouse_x,y = mouse_y){
    var pixel = surface_getpixel_ext(surface,floor(x),floor(y));
    var mr = (pixel & 255)/255;
    var mg = ((pixel>>8) & 255)/255;
    var mb = ((pixel>>16) & 255)/255;
    var ma = ((pixel>>24) & 255)/255;
    var text = string("rgba={0},{1},{2},{3}",round(mr*255),round(mg*255),(mb*255),(ma*255));
    log(text);
}