function Blur(enable,strength){
    obj_battle.is_blur = enable;
    obj_battle.blur_fx = clamp(strength,1,10);
}