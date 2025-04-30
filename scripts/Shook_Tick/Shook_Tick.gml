function Shook_Tick(){
	var camera = view_camera[0];
	if global.shook >= 0.1 {
		var shook = global.shook;
		var random_x = random_range(-10 * shook,10 * shook);
		var random_y = random_range(-10 * shook,10 * shook);
		camera_set_view_pos(camera,global.camera_x + random_x,global.camera_y + random_y);
		camera_apply(camera);
		global.shook -= 0.05;
	}else {
		camera_set_view_pos(camera,global.camera_x,global.camera_y);
		camera_apply(camera);
	}
}