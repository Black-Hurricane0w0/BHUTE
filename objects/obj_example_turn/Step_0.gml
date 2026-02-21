time ++
if time == 1 {
	//开始事件
	ArenaSet(200,200,0,320,280);
	Player_SetSoul(false,0,true);
    Player_Show();
	obj_battle.ui_enable = true;
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY {
    if time mod 120 == 0 {
        BoneCustomCreate(100,300,c_white,false,function(){
            with(other){
                var t = Battle_TurnTimeGet();
                bone_long = 60 * dsin(t) + 60;
                x++;
            }
        })
    }
}
