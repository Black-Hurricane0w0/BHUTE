//碰撞遮罩长宽随战斗框大小变化而变化
image_xscale = target_width / 2;
image_yscale = target_height / 2;
image_angle = rotation mod 360;//角度


if width < target_width {
	width += ( target_width - width ) / 4
}else {
	width -= ( width - target_width ) / 4
}
if abs(target_width - width) <= 3 {
	width = target_width;
}
if height < target_height {
	height += ( target_height- height ) / 4
}else {
	height -= ( height - target_height ) / 4
}
if abs(target_height - height) <= 3 {
	height = target_height;
}
rightside = x + target_width / 2;
leftside = x - target_width / 2;
upside = y - target_height / 2;
downside = y + target_height / 2;


if obj_battle.ui_enable == false {
	width = 0;
	height = 0;
}



bm.update(,,[target_x,target_y],).run();

pos = new vec2(x,y)


	