var draw_bone = function() {
	if color == c_blue {
		var _color = make_color_rgb(0,125,255);
	} else {
		var _color = color;
	}
	var start_x = pos.x - lengthdir_x((bone_long + 12) * offest_point,rot + 90);
	var start_y = pos.y - lengthdir_y((bone_long + 12) * offest_point,rot + 90);
	draw_sprite_ext(spr_bottom_bone,0,start_x,start_y,1,1,rot,_color,1);
	var xx = start_x;
	var yy = start_y;
	for (i = 0;i < bone_long;i++){
		xx += lengthdir_x(6 + i,rot + 90);
		yy += lengthdir_y(6 + i,rot + 90);
		draw_sprite_ext(spr_bone_pixel,0,xx,yy,1,1,rot,_color,1);
		var xx = start_x;
		var yy = start_y;
	}
	xx += lengthdir_x(6 + bone_long,rot + 90);
	yy += lengthdir_y(6 + bone_long,rot + 90);
	draw_sprite_ext(spr_top_bone,0,xx,yy,1,1,rot,_color,1);
	
	
	
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
