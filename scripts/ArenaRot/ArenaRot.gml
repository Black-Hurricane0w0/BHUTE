function ArenaRot(inst,rot){
    if inst.object_index != obj_add_arena and inst.object_index != obj_battle_arena return;
    inst.target_rotation += rot;
}