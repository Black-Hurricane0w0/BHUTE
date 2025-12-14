function Blur_Tick(){
    if !layer_exists("Blur") exit;
    layer_enable_fx("Blur",global.is_blur)
    //模糊应用
    fx_set_parameter(global.fx_blur,"g_intensity",global.blur_fx);
    fx_set_parameter(global.fx_blur,"g_numDownsamples",1+global.blur_fx/5);
    layer_set_fx("Blur",global.fx_blur);
}