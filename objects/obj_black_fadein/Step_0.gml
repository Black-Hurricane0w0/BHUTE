image_xscale = size;
image_yscale = size;

if image_alpha >= 0 {
	image_alpha -= alpha_speed;
}else {
	instance_destroy();
}