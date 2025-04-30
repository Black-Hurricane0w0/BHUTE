var start_point = 290 + array_length(damage_bit) * 30 / 2 
with (obj_target_choice) {
	if distance_to_point(320,320) <= 2 {
		var color = c_red;
	}else{
		var color = c_white;
	}
}

draw_set_color(c_white);
for (i = 0;i < array_length(damage_bit);i++){
	draw_sprite_ext(spr_damage,damage_bit[i],start_point - i * 30,125,1,1,0,color,1);
}