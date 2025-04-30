image_xscale = size;
image_yscale = size;

if image_alpha <= 1 {
	image_alpha += alpha_speed;
}else {
	instance_destroy();
}