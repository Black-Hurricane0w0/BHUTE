surface_set_target(obj_battle_arena.mask_surface);
if mask == true {
    gpu_set_blendmode_ext_sepalpha(bm_src_color,bm_zero,bm_zero,bm_dest_alpha);
	draw_self();
	surface_reset_target();
}else {
	draw_self();
}
surface_reset_target();