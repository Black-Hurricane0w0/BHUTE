function ArenaCreateAddition(height,width,rot,_x = 320,_y = 320){
    var inst = instance_create_depth(_x,_y,DEPTH.ARENA,obj_add_arena){
        inst.target_x = _x;
    	inst.target_y = _y;
    	inst.target_height = height;
    	inst.target_width = width
    	inst.target_rotation = rot;
    }
    return inst;

}