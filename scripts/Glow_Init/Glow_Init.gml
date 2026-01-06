function Glow_Init(){
    global.fx_glow = fx_create("_effect_glow");
    layer_create(-1000,"Glow");
    layer_set_fx("Glow",global.fx_glow);
    //模糊强度
    global.glow_fx = 1;
    global.is_glow = false;
    log("Glow System loaded...");
}