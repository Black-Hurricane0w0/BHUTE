var mask_surface = self.mask_surface
surface_set_target(mask_surface);
with(obj_arena){
    if state == ARENA_STATE.INSIDE {
        //白边 
        draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2,height / 2,rotation,c_white,1); 
    }
}

with(obj_arena){
    if state == ARENA_STATE.INSIDE {
     	//黑边虚假的
     	draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2 - 5,height / 2 - 5,rotation,c_black,1);
    }
}
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_src_color);
with(obj_arena){
    if state == ARENA_STATE.OUTSIDE {
        //白边 
        draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2,height / 2,rotation,c_white,1); 
    }
}
gpu_set_blendmode_ext(bm_zero,bm_zero)
with(obj_arena){
    if state == ARENA_STATE.OUTSIDE {
     	//黑边虚假的
     	draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2 - 5,height / 2 - 5,rotation,c_black,1);
    }
}
gpu_set_blendmode(bm_normal);
surface_reset_target();

//mask表面应用
draw_surface_part(mask_surface,0,0,640+2*surface_wide,480+2*surface_wide,-surface_wide,-surface_wide);
