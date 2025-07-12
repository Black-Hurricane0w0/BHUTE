if dir == 0 {
	bboxside = bbox_top;
}
if dir == 90 {
	bboxside = bbox_left;
} 
if dir == 180 {
	bboxside = bbox_bottom;
} 
if dir == 270 {
	bboxside = bbox_right;
}
image_angle = dir;
image_xscale = xsize;
image_yscale = ysize;

