function CameraPosTick(){
	var camera = view_camera[0];
	var dvalue = function(t1,t2){
		if abs(t1 - t2) >= 1 {
			t1 += (t2 - t1) / (global.camera_speed/4 + 1);
		}else {
			t1 = t2;
		}
		return t1;
	}
	global.camera_x = dvalue(global.camera_x,global.camera_targetx);
	global.camera_y = dvalue(global.camera_y,global.camera_targety);
	global.camera_width = dvalue(global.camera_width,global.camera_tar_width);
	global.camera_height = dvalue(global.camera_height,global.camera_tar_height);
	camera_set_view_pos(camera,global.camera_x,global.camera_y);
	camera_set_view_size(camera,global.camera_width,global.camera_height);
	camera_apply(camera);
}
