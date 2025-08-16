function Full_Screen(){
    var result = false;
    if gamepad_is_connected(0) {
        if gamepad_button_check_pressed(0,gp_start){
            result = true;
        }
    }else{
        if keyboard_check_pressed(vk_f4) {
            result = true;
    	}
    }
    if result == true {
        if window_get_fullscreen() == false {
        		window_set_fullscreen(true);
        }else {
        		window_set_fullscreen(false);
        }  
    }

}