function ArenaCircle(inst,is_circle,radius,with_anim = true){
    if !object_is_ancestor(inst.object_index,obj_arena) return;
        
    inst.is_circle = is_circle;
    inst.target_radius = radius;
    if with_anim == false{
        inst.radius = radius;
    }
}