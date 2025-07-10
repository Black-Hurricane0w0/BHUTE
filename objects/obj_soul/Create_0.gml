target_x = 0;
target_y = 0;

image_xscale = 1;
image_yscale = 1;
image_speed = 0;
image_index = 0;



bm = CreateAnim().add(20,[x,y],[target_x,target_y]).anim(ac_soul_move).execute(function(t){
    x = t[0];
    y = t[1];
}).listener(,,true)


