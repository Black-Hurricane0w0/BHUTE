//框体
surface_set_target(arena_surface);
with(obj_arena){
    if state == ARENA_STATE.INSIDE {
        if is_circle == false{
            //白边 
            draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2,height / 2,rotation,c_white,1); 
        }else {
            //白边 
            draw_set_color(c_white);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius,false);
        }
        
    }
}
with(obj_arena){
    if state == ARENA_STATE.INSIDE {
        if is_circle == false{
         	//黑边虚假的
         	draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2 - 5,height / 2 - 5,rotation,c_black,1); 
        }else {
            //黑边虚假的
            draw_set_color(c_black);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius-5,false);
        }
    }
}
surface_reset_target();
surface_set_target(mask_surface);
//弹幕
with(obj_arena){
    if state == ARENA_STATE.INSIDE {
        if is_circle == false{
         	//黑边虚假的
         	draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2 - 5,height / 2 - 5,rotation,c_black,1); 
        }else {
            //黑边虚假的
            draw_set_color(c_black);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius-5,false);
        }
    }
}
surface_reset_target();

//框体
surface_set_target(arena_surface)
gpu_set_blendmode_ext(bm_dest_alpha,bm_zero)
with(obj_arena){
    if state == ARENA_STATE.OUTSIDE { 
        if is_circle == false{
            //白边 
            draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2,height / 2,rotation,c_white,1); 
        }else {
            //白边
            draw_set_color(c_white);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius,false);
        }
    }
}
gpu_set_blendmode_ext(bm_zero,bm_zero)
with(obj_arena){
    if state == ARENA_STATE.OUTSIDE {
        if is_circle == false{
            //黑边虚假的
     	    draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2 - 5,height / 2 - 5,rotation,c_black,1); 
        }else {
            //黑边虚假的
            draw_set_color(c_black);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius-5,false);
        }
     	
    }
}
gpu_set_blendmode(bm_normal);
surface_reset_target();

//弹幕
surface_set_target(mask_surface)
gpu_set_blendmode_ext(bm_zero,bm_zero)
with(obj_arena){
    if state == ARENA_STATE.OUTSIDE {
        if is_circle == false{
            //黑边虚假的
     	    draw_sprite_ext(spr_battle_edge,false,x+surface_wide,y+surface_wide,width / 2 - 5,height / 2 - 5,rotation,c_black,1); 
        }else {
            //黑边虚假的
            draw_set_color(c_black);
            draw_set_alpha(1);
            draw_circle(x+surface_wide,y+surface_wide,radius-5,false);
        }
     	
    }
}
gpu_set_blendmode(bm_normal);
surface_reset_target()



with(obj_bullet){ 
    if time <= 0 continue;
    if mask == true {
        surface_set_target(obj_arena_controller.mask_surface);
        gpu_set_blendmode_ext_sepalpha(bm_src_alpha,bm_zero,bm_zero,bm_one);
    	event_perform(ev_draw,0);
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
    }else{
        surface_set_target(obj_arena_controller.arena_surface);
    	event_perform(ev_draw,0);
        surface_reset_target();
    }
}







//mask表面应用
surface_set_target(arena_surface);
gpu_set_blendmode_ext_sepalpha(bm_one,bm_one,bm_zero,bm_dest_alpha)
draw_surface(mask_surface,0,0)
gpu_set_blendmode(bm_normal);
surface_reset_target();

//arena表面应用
draw_surface(arena_surface,-surface_wide,-surface_wide);

