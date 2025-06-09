if obj_battle.ui_enable == true {
    surface_set_target(mask_surface);
    gpu_set_tex_filter(true);
    //白边
	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2,height / 2,rotation,c_white,1);
	//黑边虚假的
	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2 - 5,height / 2 - 5,rotation,c_black,1);
    
    gpu_set_tex_filter(false);
    
    
    surface_reset_target();
    
    surface_set_target(obj_battle_arena.mask_surface);
       	with(obj_bone_4){
            if (mask) {
                gpu_set_blendmode_ext_sepalpha(bm_src_color,bm_zero,bm_zero,bm_dest_alpha);
                draw_function();
                gpu_set_blendmode(bm_normal);
            }else{
                draw_function();
            }
        }
    surface_reset_target();
    draw_surface(mask_surface,0,0);
    
}
