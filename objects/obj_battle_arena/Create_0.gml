event_inherited();
target_width = 575;
target_height = 140;
movesoul = true;
bm = CreateAnim().add(30,[x,y],[target_x,target_y]).anim(ac_arena_move).execute(function(t){ 
    x = t[0];
    y = t[1];
    if movesoul == true and instance_exists(obj_move_soul) {
    	Player_PosSet(x,y);
    }
}).listener(false,false,true,false);
