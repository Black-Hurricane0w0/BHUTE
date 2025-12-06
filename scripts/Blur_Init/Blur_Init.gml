function Blur_Init(){
    global.fx_blur = fx_create("_effect_gaussian_blur");
    layer_create(-1000,"Blur");
    layer_set_fx("Blur",global.fx_blur);
    //模糊强度
    global.blur_fx = 1;
    global.is_blur = false;
    log("Blur System finished...")
}