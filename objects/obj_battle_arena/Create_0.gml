width = 575;
height = 140;
rotation = 0;
target_x = 320;
target_y = 320;
x = 320;
y = 320;
pos = new vec2(target_x,target_y)
movesoul = false;


target_width = 575;
target_height = 140;
depth = DEPTH.ARENA;
mask_index = spr_battle_edge;

mask_surface = -1;
arena_surface = -1; 
limit_pointsx = array_create(0);
limit_pointsy = array_create(0);
array_push(limit_pointsx,new vec2(640,240),new vec2(0,240));
array_push(limit_pointsy,new vec2(320,480),new vec2(320,0));
delete_vec_array = array_create(0);