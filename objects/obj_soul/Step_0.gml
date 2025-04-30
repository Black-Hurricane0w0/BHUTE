//获取方向
dir = point_direction(x,y,target_x,target_y);
//获取距离
distance = point_distance(x,y,target_x,target_y);


if (distance >= 1) {
	x += lengthdir_x(distance / 5,dir);
	y += lengthdir_y(distance / 5,dir);
}
if distance <= 1{
	x = target_x;
	y = target_y;
}

if global.soul_color == c_red {
	image_index = 0;
}else {
	image_index = 1;
}
if room = Room_Battle {
	if obj_battle.ui_enable == true {
		visible = true;
	}else {
		visible = false;
	}
}
