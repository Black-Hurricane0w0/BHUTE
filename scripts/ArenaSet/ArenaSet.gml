function ArenaSet(height,width,rot,_x = 320,_y = 320,is_movesoul = true){
	obj_battle_arena.target_x = _x;
	obj_battle_arena.target_y = _y;
	obj_battle_arena.target_height = height;
	obj_battle_arena.target_width = width
	obj_battle_arena.rotation = rot;
	obj_battle_arena.is_change = true;
	obj_battle_arena.movesoul = is_movesoul;
}