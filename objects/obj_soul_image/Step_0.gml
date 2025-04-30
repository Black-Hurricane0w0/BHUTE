image_xscale += 1 / 10;
image_yscale += 1 / 10;
image_alpha -= 1 / 20;
if image_alpha <= 0 {
	instance_destroy(self);
}
if global.soul_color == c_red {
	image_index = 0;
}else {
	image_index = 1;
}