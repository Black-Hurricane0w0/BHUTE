

var draw_bone = function() {
    //绘制
        var alpha = 1;
        var _color = color
        if color == c_blue {
    		_color = #0AFCF0;
    	} 
    	var start_x = pos.x - lengthdir_x((bone_long + 12) * offest_point,rot + 90);
    	var start_y = pos.y - lengthdir_y((bone_long + 12) * offest_point,rot + 90);
    	draw_sprite_ext(spr_bottom_bone,0,start_x,start_y,1,1,rot,_color,alpha);
    	var xx = start_x;
    	var yy = start_y;
    	for (i = 0;i < bone_long;i++){
    		xx += lengthdir_x(6 + i,rot + 90);
    		yy += lengthdir_y(6 + i,rot + 90);
    		draw_sprite_ext(spr_bone_pixel,0,xx,yy,1,1,rot,_color,alpha);
    		xx = start_x;
    		yy = start_y;
    	}
    	xx += lengthdir_x(6 + bone_long,rot + 90);
    	yy += lengthdir_y(6 + bone_long,rot + 90);
    	draw_sprite_ext(spr_top_bone,0,xx,yy,1,1,rot,_color,alpha);
}

surface_set_target(obj_battle_arena.mask_surface);
if (mask) {
    gpu_set_blendmode_ext_sepalpha(bm_src_alpha,bm_zero,bm_zero,bm_one);
    draw_bone();
    gpu_set_blendmode(bm_normal);
}else{
    draw_bone();
}
surface_reset_target();