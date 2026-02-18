//ui隐藏不绘制
if obj_battle.ui_enable == false exit;
//框体
surface_set_target(arena_surface);
with(obj_arena){
    if state == ARENA_STATE.INSIDE || state == ARENA_STATE.NOHIT {
        if is_circle == false{
            //白边 
            draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2,height / 2,rotation,global.arena_outside_color,1); 
        }else {
            //白边 
            draw_set_color(global.arena_outside_color);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius,false);
        }
    }
}
surface_reset_target();

//弹幕
surface_set_target(mask_surface);
with(obj_arena){
    if state == ARENA_STATE.INSIDE || state == ARENA_STATE.NOHIT {
        if is_circle == false{
            //白边 
            draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2,height / 2,rotation,global.arena_outside_color,1); 
        }else {
            //白边 
            draw_set_color(global.arena_outside_color);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius,false);
        }
    }
}
surface_reset_target();
//框体
surface_set_target(arena_surface);
with(obj_arena){
    if state == ARENA_STATE.INSIDE || state == ARENA_STATE.NOHIT {
        if is_circle == false{
         	//黑边虚假的
         	draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2 - 5,height / 2 - 5,rotation,global.arena_inside_color,1); 
        }else {
            //黑边虚假的
            draw_set_color(global.arena_inside_color);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius-5,false);
        }  
    }
}
surface_reset_target();
//弹幕
surface_set_target(mask_surface);
with(obj_arena){
    if state == ARENA_STATE.INSIDE || state == ARENA_STATE.NOHIT {
        if is_circle == false{
         	//黑边虚假的
         	draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2 - 5,height / 2 - 5,rotation,global.arena_inside_color,1); 
        }else {
            //黑边虚假的
            draw_set_color(global.arena_inside_color);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius-5,false);
        }
    }
}
surface_reset_target();



//弹幕
surface_set_target(mask_surface)
gpu_set_blendmode_ext(bm_dest_alpha,bm_zero)
with(obj_arena){
    if state == ARENA_STATE.OUTSIDE { 
        if is_circle == false{
            //白边 
            draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2,height / 2,rotation,global.arena_outside_color,1); 
        }else {
            //白边
            draw_set_color(global.arena_outside_color);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius,false);
        }
    }
}
gpu_set_blendmode_ext(bm_zero,bm_zero)
with(obj_arena){
    if state == ARENA_STATE.OUTSIDE {
        if is_circle == false{
            //黑
     	    draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2-5,height / 2-5,rotation,c_black,1); 
        }else {
            //黑
            draw_set_color(c_black);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius-5,false);
        }
    }
}
gpu_set_blendmode(bm_normal);
surface_reset_target()


//弹幕显示
with(obj_bullet){ 
    if time <= 0 continue;
    if mask == true {
        surface_set_target(obj_arena_controller.mask_surface);
        gpu_set_blendmode_ext_sepalpha(bm_src_alpha,bm_inv_src_alpha,bm_zero,bm_one);
    	event_user(0);
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
    }else{
        surface_set_target(obj_arena_controller.mask_surface);
    	event_user(0);
        surface_reset_target();
    }
}
//灵魂绘制
with(obj_move_soul){
    if is_drawn and is_active{
        surface_set_target(obj_arena_controller.mask_surface);
        draw_sprite_ext(spr_move_soul,global.soul_color,obj_move_soul.x + global.surface_wide,obj_move_soul.y + global.surface_wide,1,1,image_angle,c_white,1);
        surface_reset_target();
    }
}







//mask表面应用
surface_set_target(arena_surface);
gpu_set_blendmode_ext(bm_one,bm_zero);
draw_surface(mask_surface,0,0)
gpu_set_blendmode(bm_normal);
surface_reset_target();

//arena表面应用
draw_surface(mask_surface,-surface_wide,-surface_wide);

