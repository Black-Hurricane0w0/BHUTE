if obj_battle.battle_state == BATTLE_STATE.ENEMY and obj_battle.ui_enable == true {
    //mask表面应用
    draw_surface_part(mask_surface,0,0,640+2*surface_wide,480+2*surface_wide,-surface_wide,-surface_wide)
}
