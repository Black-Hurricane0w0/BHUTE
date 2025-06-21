if obj_battle.ui_enable == true {
    surface_set_target(mask_surface);
    gpu_set_tex_filter(true);
    //白边
	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2,height / 2,rotation,c_white,1);
	//黑边虚假的
	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2 - 5,height / 2 - 5,rotation,c_black,1);
    
    gpu_set_tex_filter(false);

    surface_reset_target();
}    