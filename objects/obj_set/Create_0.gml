
Shook_Create();

debug = true;
esc = 0;
vibration_time = 0;//手柄震动时间
vibration_value = 0;//手柄震动强度
//模拟输入成功
gamepad_axis = {
    lv_up : false,
    lv_down : false,
    lh_left : false,
    lh_right : false,
}
debug_surface = -1;
version = "v1.03"
buffer_surface = -1;
per_fullscreen = window_get_fullscreen();
time_fullscreen = 0;