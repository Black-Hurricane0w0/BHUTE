function ArenaSet(height,width,rot,_x = 320,_y = 320,is_movesoul = false,with_anim = true){
	obj_battle_arena.target_x = _x;
	obj_battle_arena.target_y = _y;
	obj_battle_arena.target_height = height;
	obj_battle_arena.target_width = width
	obj_battle_arena.target_rotation = rot;
	obj_battle_arena.movesoul = is_movesoul;
    obj_battle_arena.pos = new vec2(_x,_y);
    if with_anim = false {
        obj_battle_arena.x = _x;
        obj_battle_arena.y = _y;
    }
}