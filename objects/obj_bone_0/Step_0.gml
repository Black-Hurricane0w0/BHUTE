// Inherit the parent event


time ++;
sprite_set_offset(spr_bone_0,6,40);
image_xscale = 1;
image_yscale = (bone_long + 12) / 40;
direction = facing * 90;
image_angle = facing * 90;

x += lengthdir_x(move_speed,direction);
y += lengthdir_y(move_speed,direction);

event_inherited();
