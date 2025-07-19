if !is_active exit;
surface_set_target(obj_arena_drawer.mask_surface);
draw_sprite(spr_move_soul,image_index,x+obj_arena_drawer.surface_wide,y+obj_arena_drawer.surface_wide)
surface_reset_target();
