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





 //2. 检查并确保 application_surface 有效
//if (!surface_exists(application_surface)) {
     //如果不存在，这一帧跳过绘制。通常这意味着游戏还没开始渲染。
    //exit;
//}
//
 //3. 【关键】创建一个离屏表面作为“画布”，避免纹理/表面绑定冲突
    //管理这个表面的生命周期
//if (!surface_exists(buffer_surface)) {
    //buffer_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
//}
//
 //4. 将渲染目标切换到我们创建的离屏表面
//surface_set_target(buffer_surface);
 //可选：清空为透明黑
//draw_clear_alpha(c_black, 0);
//
 //5. 启用你的Bloom着色器
//var _shader = sh_blur;  请替换为你的着色器资产名称
//shader_set(_shader);
//
 //6. 传递必要的Uniform变量（例如分辨率）
//var _uRes = shader_get_uniform(_shader, "u_Resolution");
//if (_uRes != -1) {
    //shader_set_uniform_f(_uRes, surface_get_width(application_surface), surface_get_height(application_surface), 0.0);
//}
 //7. 传递可调参数Uniform（如果着色器中使用了这些变量）
 //阈值参数
//var _uThreshold = shader_get_uniform(_shader, "u_Threshold");
//if (_uThreshold != -1) {
    //shader_set_uniform_f(_uThreshold, 0.7);  默认值0.7，可调
//}
//
 //模糊半径参数
//var _uBlurRadius = shader_get_uniform(_shader, "u_BlurRadius");
//if (_uBlurRadius != -1) {
    //shader_set_uniform_f(_uBlurRadius, 6.0);  默认值3.0，可调
//}
//
 //Bloom强度参数
//var _uBloomIntensity = shader_get_uniform(_shader, "u_BloomIntensity");
//if (_uBloomIntensity != -1) {
    //shader_set_uniform_f(_uBloomIntensity, 0.2);  默认值1.2，可调
//}
//
 //7. 【最核心的一步】在着色器激活的状态下，将 application_surface 绘制到离屏表面。
    //此时，着色器内的 `gm_BaseTexture` 正确地指向了 application_surface 的内容。
//draw_surface(application_surface, 0, 0);
//
 //8. 着色器使用完毕，立即重置
//shader_reset();
//
 //9. 将渲染目标切换回默认的屏幕（或游戏窗口）
//surface_reset_target();
//
 //10. 最后，将处理好的离屏表面绘制到屏幕上
//draw_surface(buffer_surface, 0, 0);

time_fullscreen++;
if window_get_fullscreen() != per_fullscreen {
    if time_fullscreen >= 15{
        surface_free(obj_set.buffer_surface);
        obj_set.buffer_surface = -1;
        draw_texture_flush();
        per_fullscreen = window_get_fullscreen();
        log("flush")
    }
}else { time_fullscreen = 0; } 

