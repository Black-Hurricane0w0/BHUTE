function ArenaClearAddition(){
    var num = instance_number(obj_add_arena);
    for (var i = 0; i < num; i++) {
        instance_destroy(instance_find(obj_add_arena,0));
    }
}