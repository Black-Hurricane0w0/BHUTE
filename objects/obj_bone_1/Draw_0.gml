var draw_bone = function() {
	draw_set_color(c_white);
	draw_sprite_ext(spr_bottom_bone,0,x,y,1,1,image_angle,c_white,1);
	switch (facing) {
		case 0 : {
			for (i = 0;i < bone_long;i++){
				draw_sprite_ext(spr_bone_pixel,0,x,y - 6 - i,1,1,image_angle,c_white,1);
			}
			draw_sprite_ext(spr_top_bone,0,x,y - 6 - i,1,1,image_angle,c_white,1);
			break;
		}
		case 1 :{
			for (i = 0;i < bone_long;i++){
				draw_sprite_ext(spr_bone_pixel,0,x - 6 - i,y,1,1,image_angle,c_white,1);
			}
			draw_sprite_ext(spr_top_bone,0,x - 6 - i,y,1,1,image_angle,c_white,1);
			break;
		}
		case 2 :{
			for (i = 0;i < bone_long;i++){
				draw_sprite_ext(spr_bone_pixel,0,x,y + 6 + i,1,1,image_angle,c_white,1);
			}
			draw_sprite_ext(spr_top_bone,0,x,y + 6 + i,1,1,image_angle,c_white,1);
			break;
		}
		case 3 :{
			for (i = 0;i < bone_long;i++){
				draw_sprite_ext(spr_bone_pixel,0,x + 6 + i,y,1,1,image_angle,c_white,1);
			}
			draw_sprite_ext(spr_top_bone,0,x + 6 + i,y,1,1,image_angle,c_white,1);
			break;
		}
	}
	
	
	
}

if mask == true {
	surface_set_target(obj_battle_arena.mask_surface);
	if bone_long >= 0 {
		draw_bone();
	}
	surface_reset_target();
}else {
	if bone_long >= 0 {
		draw_bone();
	}
}