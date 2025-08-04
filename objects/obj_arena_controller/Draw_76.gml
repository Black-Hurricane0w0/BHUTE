if not surface_exists(mask_surface) {
	mask_surface = surface_create(640+2*surface_wide,480+2*surface_wide);
}
surface_set_target(mask_surface);
draw_clear_alpha(c_black,0);
surface_reset_target();

if not surface_exists(arena_surface) {
	arena_surface = surface_create(640+2*surface_wide,480+2*surface_wide);
}
surface_set_target(arena_surface);
draw_clear_alpha(c_black,0);
surface_reset_target();