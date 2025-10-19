time ++;
image_xscale = size;
image_yscale = size;
bm.run();

if time <= maxtime {
	image_alpha = bm.getvalue();
}else {
	instance_destroy();
}