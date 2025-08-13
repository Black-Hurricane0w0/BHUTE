function Enemy_Remove(enemy){
    array_delete(global._enemy,enemy,1);
    instance_destroy(instance_find(obj_basic_enemy,enemy));
    for (var i = 0; i < instance_number(obj_basic_enemy); i++) {
        instance_find(obj_basic_enemy,i).enemy = i; 
    }
}