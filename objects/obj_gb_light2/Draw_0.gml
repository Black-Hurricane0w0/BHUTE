draw_self()
if glowing == true {
    gpu_set_blendmode(bm_add);
    gpu_set_texfilter(true);
    draw_sprite_ext(spr_gb_light_growing,0,x,y,1,1,image_angle,c_white,image_alpha);
    gpu_set_texfilter(false);
    gpu_set_blendmode(bm_normal);
}
