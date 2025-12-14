function Glow_Tick(){
    if !layer_exists("Glow") exit;
    layer_enable_fx("Glow",global.is_glow)
    //模糊应用
    fx_set_parameter(global.fx_glow,"g_GlowAlpha",global.glow_fx);
    fx_set_parameter(global.fx_glow,"g_GlowRadius",global.glow_fx*1024);
    layer_set_fx("Glow",global.fx_glow);
}