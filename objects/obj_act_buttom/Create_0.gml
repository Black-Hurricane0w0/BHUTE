image_speed = 0;
image_xscale = 1;
image_yscale = 1;

time = 0;
target_x = 240;
target_y = 620;
surface = -1;

state = 0;
bm = CreateAnim().add(20,state,image_index).anim(ac_speeddown).listener(false,false,true,false);