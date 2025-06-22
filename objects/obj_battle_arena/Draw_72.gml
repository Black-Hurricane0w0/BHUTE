
if obj_battle.battle_state == BATTLE_STATE.ENEMY and obj_battle.ui_enable == true{
    surface_set_target(mask_surface);
 	//黑边虚假的
 	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2 - 5,height / 2 - 5,rotation,c_black,1);
    surface_reset_target();
}