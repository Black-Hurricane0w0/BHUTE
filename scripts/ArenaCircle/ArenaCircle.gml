function ArenaCircle(inst,is_circle,radius,with_anim = true){
    if inst.object_index != obj_arena and inst.object_index != obj_add_arena and inst.object_index != obj_battle_arena return;
        
    inst.is_circle = is_circle;
    inst.target_radius = radius;
    if with_anim == false{
        inst.radius = radius;
    }
}