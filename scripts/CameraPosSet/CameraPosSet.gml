function CameraPosSet(_x,_y,width,height,_speed){
	var camera = view_camera[0];
	global.camera_targetx = _x - width / 2;
	global.camera_targety = _y - height / 2;
	global.camera_tar_width = width;
	global.camera_tar_height = height;
	global.camera_speed = _speed;
}
function CameraPosSetInsize(_x,_y,size,_speed = 1){
	CameraPosSet(_x,_y,size,size /4 * 3,_speed);
}

