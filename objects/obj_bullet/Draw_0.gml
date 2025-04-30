if mask == true {
	surface_set_target(obj_battle_arena.mask_surface);
	draw_self();
	surface_reset_target();
}else {
	draw_self();
}