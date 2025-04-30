function Part_Type_Set(_sprite,_size = 1,_color = c_white,_alpha = 1,_speed1 = 1,_speed2 = 1,_life1 = 60,_life2 = 60,_dir1 = 0,_dir2 = 0,_gravity = 10){
	part_type_sprite(global._part_type,_sprite,false,false,true);
	part_type_size(global._part_type,_size,_size,0,0);
	part_type_color1(global._part_type,_color);
	part_type_alpha1(global._part_type,_alpha);
	part_type_speed(global._part_type,_speed1,_speed2,0,0);
	part_type_direction(global._part_type,_dir1,_dir2,0,0);
	part_type_orientation(0,0,0,0,0,true);
	part_type_blend(global._part_type,false);
	part_type_life(global._part_type,_life1,_life2)
	part_type_gravity(global._part_type,_gravity,270)
	
	
}