surface_set_target(obj_battle_arena.mask_surface);
if mask == true {
    gpu_set_blendmode_ext_sepalpha(bm_src_alpha,bm_zero,bm_zero,bm_one);
	draw_sprite(spr,image_index,x + obj_battle_arena.surface_wide,y + obj_battle_arena.surface_wide)
	surface_reset_target();
}else {
	draw_self();
}
surface_reset_target();