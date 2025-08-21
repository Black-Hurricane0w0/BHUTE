var sh_texture = shader_get_sampler_index(sh_transit_color,"ScrTexture")
var sh_timer = shader_get_uniform(sh_transit_color, "timer");
shader_set(sh_transit_color);
    shader_set_uniform_f(sh_timer,state);
    texture_set_stage(sh_texture,sprite_get_texture(spr_fight_2,0));
    draw_sprite(spr_fight_2,1,x,y);
shader_reset();

