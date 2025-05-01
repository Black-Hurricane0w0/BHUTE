
event_inherited();
depth = DEPTH.BULLET_OUTSIDE;
mask = false;


x = 300
y = 300
facing = random_range(0,360)
x += lengthdir_x(200,facing);
y += lengthdir_y(200,facing);
image_alpha = 0.1;
facing = point_direction(x,y,obj_move_soul.pos.x,obj_move_soul.pos.y)