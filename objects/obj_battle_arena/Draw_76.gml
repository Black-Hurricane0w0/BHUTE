if not surface_exists(mask_surface) {
	mask_surface = surface_create(640,480);
}
surface_set_target(mask_surface);
draw_clear_alpha(c_white,0);
surface_reset_target();

