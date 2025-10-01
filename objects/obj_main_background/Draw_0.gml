var sh_t = shader_get_uniform(sh_background,"f_t");
shader_set(sh_background);
shader_set_uniform_f(sh_t,time / 1000);
    gpu_set_tex_repeat(true);
    draw_sprite_ext(spr_city,0,0,0,3,3,0,c_white,alpha);
    gpu_set_tex_repeat(false);
shader_reset();