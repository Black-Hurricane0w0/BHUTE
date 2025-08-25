function ArenaClearAddition(){
    for (var i = 0; i < instance_number(obj_add_arena); i++) {
        instance_destroy(instance_find(obj_add_arena,i));
    }
}