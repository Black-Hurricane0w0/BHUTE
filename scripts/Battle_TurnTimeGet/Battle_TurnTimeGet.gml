function Battle_TurnTimeGet(){
    if instance_exists(obj_battle.turn_inst) {
        return obj_battle.turn_inst.time;
    }else{
        return -1;
    }
}