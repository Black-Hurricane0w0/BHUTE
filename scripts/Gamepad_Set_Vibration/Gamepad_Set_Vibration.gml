function Gamepad_Set_Vibration(time,value){
    obj_set.vibration_time = time;
    obj_set.vibration_value = clamp(value,0,1);
}