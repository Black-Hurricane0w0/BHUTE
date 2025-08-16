function Input_Check(input,state){
	var bool_value = false;//返回值
	var buttom = ds_map_find_value(global._input_map,input)//将ds地图中对应的value付给buttom，用于后续检查
	if ds_map_exists(global._input_map,input){
			if gamepad_is_connected(0) == true {
				switch (state){//手柄情况下
					case INPUT_STEAT.KEEP:{
						if gamepad_button_check(0,buttom){
							bool_value = true;
						}
						break;
					}
					case INPUT_STEAT.PRESSED:{
						if gamepad_button_check_pressed(0,buttom){
							bool_value = true;
						}
						break;
					}
					case INPUT_STEAT.RELEASED:{
						if gamepad_button_check_released(0,buttom){
							bool_value = true;
						}
						break;
					}
					case INPUT_STEAT.NULL:{
						if !gamepad_button_check(0,buttom) && !gamepad_button_check_pressed(0,buttom) && !gamepad_button_check_released(0,buttom) {
							bool_value = true;
						}
						break;
					}
				}	
			}else {
				switch (state){//state就是当前按下状态，满足一下四种之一，若为真返回true
					case INPUT_STEAT.KEEP:{
						if keyboard_check(buttom){
							bool_value = true;
						}
						break;
					}
					case INPUT_STEAT.PRESSED:{
						if keyboard_check_pressed(buttom){
							bool_value = true;
						}
						break;
					}
					case INPUT_STEAT.RELEASED:{
						if keyboard_check_released(buttom){
							bool_value = true;
						}
						break;
					}
					case INPUT_STEAT.NULL:{
						if !keyboard_check_pressed(buttom) && !keyboard_check(buttom) && !keyboard_check_released(buttom) {
							bool_value = true;
						}
						break;
					}
				}	
			}
	}else{
		return false;
	}
    //摇杆
    if gamepad_is_connected(0) == true {
        var lv = gamepad_axis_value(0,gp_axislv);
        var lh = gamepad_axis_value(0,gp_axislh);
        switch (state) { 
            case INPUT_STEAT.KEEP:{
				switch (input) {
                    case INPUT.UP:
                        if lv < -global.gamepad_value {
                            bool_value = true;
                        }
                        break;
                    case INPUT.DOWN:
                        if lv > global.gamepad_value {
                            bool_value = true;
                        }
                        break;
                    case INPUT.LEFT:
                        if lh < -global.gamepad_value {
                            bool_value = true;
                        }
                        break;
                    case INPUT.RIGHT:
                        if lh > global.gamepad_value {
                            bool_value = true;
                        }
                        break;
                }
				break;
			}
			case INPUT_STEAT.PRESSED:{
				switch (input) {
                    case INPUT.UP:
                        if lv < -global.gamepad_value and obj_set.gamepad_axis.lv_up == false {
                            bool_value = true;
                        }
                        break;
                    case INPUT.DOWN:
                        if lv > global.gamepad_value and obj_set.gamepad_axis.lv_down == false{
                            bool_value = true;
                        }
                        break;
                    case INPUT.LEFT:
                        if lh < -global.gamepad_value and obj_set.gamepad_axis.lh_left == false {
                            bool_value = true;
                        }
                        break;
                    case INPUT.RIGHT:
                        if lh > global.gamepad_value and obj_set.gamepad_axis.lh_right == false {
                            bool_value = true;
                        }
                        break;
                }
				break;
			}
			case INPUT_STEAT.RELEASED:{
				switch (input) {
                    case INPUT.UP:
                        if lv > -global.gamepad_value and obj_set.gamepad_axis.lv_up == true {
                            bool_value = true;
                        }
                        break;
                    case INPUT.DOWN:
                        if lv < global.gamepad_value and obj_set.gamepad_axis.lv_down == true {
                            bool_value = true;
                        }
                        break;
                    case INPUT.LEFT:
                        if lh > -global.gamepad_value and obj_set.gamepad_axis.lh_left == true { 
                            bool_value = true;
                        }
                        break;
                    case INPUT.RIGHT:
                        if lh > global.gamepad_value and obj_set.gamepad_axis.lh_right == true { 
                            bool_value = true;
                        }
                        break;
                }
				break;
			}
        }
    }
	return bool_value;
}