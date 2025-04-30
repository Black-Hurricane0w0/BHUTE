
//var x_start = x - 25;
//if time >= 80 {
//	time = 80;
//}



if Item_Number() > 0 {
	//draw_sprite_part(spr_item,0,110 - time,0,time,42,x_start,y - 21);
	draw_self();
}else {
	shader_set(sh_gray);
	//if be_chosen == false {
	//	draw_sprite_ext(spr_item_1,0,x,y,1,1,0,c_gray,0.9);
	//}else{
	//	draw_sprite_ext(spr_item_1,1,x,y,1,1,0,c_gray,0.9);
	//}
	//draw_sprite_part_ext(spr_item,0,110 - time,0,time,42,x_start,y - 21,1,1,c_gray,0.9);
	draw_self();
	shader_reset();
}
