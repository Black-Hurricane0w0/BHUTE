function Glow(enable,strength){
    global.is_glow = enable;
    global.glow_fx = clamp(strength,0,1);
}