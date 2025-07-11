if !is_active exit;
surface_set_target(obj_battle_arena.mask_surface);
draw_sprite(spr_move_soul,image_index,x+obj_battle_arena.surface_wide,y+obj_battle_arena.surface_wide)
surface_reset_target();
