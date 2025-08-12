function Enemy_Add(_x,_y,enemy_obj){
    if !object_is_ancestor(enemy_obj,obj_basic_enemy) return;
	var inst = instance_create_depth(_x,_y,DEPTH.ENEMY,enemy_obj){
        inst.enemy = instance_number(obj_basic_enemy) - 1;
    }
}