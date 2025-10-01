function DebugSurfaceClear(){
    surface_set_target(obj_set.debug_surface);
    draw_clear_alpha(c_black,0);
    surface_reset_target();
}