if not surface_exists(debug_surface) {
	debug_surface = surface_create(640,480);
    surface_set_target(debug_surface);
    draw_clear_alpha(c_black,0);
    surface_reset_target();
}
