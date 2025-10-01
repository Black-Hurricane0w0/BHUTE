/// @desc 设置相机
/// @param {real} _x x位置
/// @param {real} _y y位置
/// @param {real} width 相机宽度
/// @param {real} height 相机高度
/// @param {real} _speed 相机速度
/// @param {real} angle 旋转角度
function CameraPosSet(_x,_y,width,height,angle,_speed){
	var camera = view_camera[0];
	global.camera_targetx = _x - width / 2;
	global.camera_targety = _y - height / 2;
	global.camera_tar_width = width;
	global.camera_tar_height = height;
	global.camera_speed = _speed;
    global.camera_tar_angle = angle;
}
/**
 * 设置标准比例相机
 * @param {real} _x x位置
 * @param {real} _y y位置
 * @param {real} size 相机大小
 * @param {real} _speed 相机速度
 * @param {real} angle 旋转角度
 */
function CameraPosSetInsize(_x,_y,size,angle,_speed = 1){
	CameraPosSet(_x,_y,size,size /4 * 3,angle,_speed);
}

