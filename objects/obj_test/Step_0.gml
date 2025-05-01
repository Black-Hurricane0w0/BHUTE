time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,0);
    obj_move_soul.pos.x = 320;
    obj_move_soul.pos.y = 320;
}

if obj_battle.battle_state == BATTLE_STATE.ENEMY {
	ArenaSet(200,300,0,,,false);
	//if time mod 60 == 0 {
	//	BoneRotCreate(new vec2(100,320),2,0,30,30,0,0,c_white,0.5,ac_bone_default,ac_bone_default,0,0,true,infinity,);
	//}
    //var pos = new vec2(mouse_x,mouse_y);
    //var vec = get_vector(obj_move_soul.pos,pos)
    //log(vec.toGameMakerCoords().getdirection())
}