function DebugSurfaceClear(){
    if not surface_exists(obj_set.debug_surface) {
	    obj_set.debug_surface = surface_create(640,480);
    }
    surface_set_target(obj_set.debug_surface);
    draw_clear_alpha(c_black,0);
    surface_reset_target();
}