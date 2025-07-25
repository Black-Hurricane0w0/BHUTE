width = 575;
height = 140;
rotation = 0;
target_rotation = 0;
target_x = 320;
target_y = 320;
x = 320;
y = 320;
pos = new vec2(target_x,target_y)
surface_wide = 600;
state = ARENA_STATE.INSIDE;

target_width = 200;
target_height = 200;
depth = DEPTH.ARENA;
mask_index = spr_battle_edge;

mask_surface = -1;

bm = CreateAnim().add(30,[x,y],[target_x,target_y]).anim(ac_arena_move).execute(function(t){ 
    x = t[0];
    y = t[1];
}).listener(false,false,true,false);
bm2 = CreateAnim().add(30,[width,height],[target_width,target_height]).anim(ac_arena_move).execute(function(t){ 
    width = t[0];
    height = t[1];
}).listener(false,false,true,false);
bm3 = CreateAnim().add(30,rotation,target_rotation).anim(ac_arena_move).execute(function(t){ 
    rotation = t;
}).listener(false,false,true,false);


player_points = array_create(0);