// Inherit the parent event

time ++;

if bone_long < bone_max_long and keep_time > 0 {
	bone_long += bone_long_speed;
}
if bone_long >= bone_max_long and keep_time > 0 {
	bone_long = bone_max_long;
	keep_time --;
}
if keep_time <= 0 {
	bone_long -= bone_long_speed;
	if bone_long <= 0 {
		instance_destroy();
	}
}



image_xscale = 1;
image_yscale = (bone_long + 12) / 40;
direction = facing * 90;
image_angle = facing * 90;
sprite_set_offset(spr_bone_0,6,40);


x += lengthdir_x(move_speed,direction);
y += lengthdir_y(move_speed,direction);


event_inherited();

