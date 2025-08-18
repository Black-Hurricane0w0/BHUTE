image_speed = 0;
image_xscale = 1;
image_yscale = 1;

target_x = 555;
target_y = 620;
time = 0;

state = 0;
bm = CreateAnim().add(40,state,image_index).anim(ac_speeddown).listener(false,false,true,false);