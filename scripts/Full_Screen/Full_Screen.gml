function Full_Screen(){
	if keyboard_check_pressed(vk_f4) {
		if window_get_fullscreen() == false {
				window_set_fullscreen(true);
		}else {
				window_set_fullscreen(false);
		}
	}
}