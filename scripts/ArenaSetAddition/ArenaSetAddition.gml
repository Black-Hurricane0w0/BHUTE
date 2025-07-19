function ArenaSetAddition(inst,height,width,rot,state = ARENA_STATE.INSIDE,_x = 320,_y = 320){
    if inst.object_index != obj_add_arena return;
	inst.target_x = _x;
	inst.target_y = _y;
	inst.target_height = height;
	inst.target_width = width
	inst.target_rotation = rot;
    inst.state = state;
    return inst;
}