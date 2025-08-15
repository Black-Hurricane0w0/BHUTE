//手柄位置修正

var lv = gamepad_axis_value(0,gp_axislv);
var lh = gamepad_axis_value(0,gp_axislh);
if lv < -global.gamepad_value {
    obj_set.gamepad_axis.lv_up = true;
}else{
    obj_set.gamepad_axis.lv_up = false;
}
if lv > global.gamepad_value {
    obj_set.gamepad_axis.lv_down = true;
}else{
    obj_set.gamepad_axis.lv_down = false;
}
if lh < -global.gamepad_value {
    obj_set.gamepad_axis.lh_left = true;
}else{
    obj_set.gamepad_axis.lh_left = false;
}
if lh > global.gamepad_value {
    obj_set.gamepad_axis.lh_right = true;
}else{
    obj_set.gamepad_axis.lh_right = false;
}
