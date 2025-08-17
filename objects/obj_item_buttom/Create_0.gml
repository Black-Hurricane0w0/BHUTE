image_speed = 0;
image_xscale = 1;
image_yscale = 1;

target_x = 400;
target_y = 620;
time = 0;
be_chosen = false;

state = 0;
bm = CreateAnim().add(20,state,image_index).anim(ac_speeddown).listener(false,false,true,false);