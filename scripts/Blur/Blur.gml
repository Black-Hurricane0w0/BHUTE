function Blur(enable,strength){
    global.is_blur = enable;
    global.blur_fx = clamp(strength,1,5);
}