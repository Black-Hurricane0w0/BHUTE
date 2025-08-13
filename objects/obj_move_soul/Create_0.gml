image_xscale = 1;
image_yscale = 1;
x=320;
y=240;
pos = new vec2(x,y);
image_speed = 0;
image_index = 0;
gravity = 0;
dir = 270;
depth = DEPTH.SOUL;

is_moved = false;
is_gravity = false;
is_onground = false;
move_speed = 2.5;
invulnerable = false;
keep_up_time = 0;
jump_state = 0;
max_speed = 3;
drop = false;
onplatform = false;
outside = false;
friction_coefficent = 45;//摩擦临界角度(角度制)
kr_time = 0;//kr免疫阶段

gravity_jump = 0.15;
gravity_fall = 0.15;
jump_speed = 4.6;
max_speed = 8;
gmove = 0;
air_time = 0;

is_active = true;