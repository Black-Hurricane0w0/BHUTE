var summon_char = function(){
	if (x + char_x) > x_newline{
		char_y += string_height(string_char_at(text,char_index)) * text_size;
		char_x = 0;
	}
	var inst = instance_create_depth(x + char_x,y + char_y,depth,obj_char);//创建字符实例，并将实例id用inst接受，inst代指该字符
	inst.text = string_char_at(text,char_index);//传参
	inst.text_font = text_font;
	inst.text_color = text_color;
	inst.text_size = text_size;
	inst.text_snd = text_snd;
    inst.text_number = char_index;
    inst.text_func = text_func;
    inst.text_printer = id;
	//加入字符列表
	ds_list_add(char_list,inst);
    
    char_x += string_width(string_char_at(text,char_index)) * text_size//加x
	char_index ++;
	if inst.text == " " {
		time = text_speed;
	}else if inst.text == "&" {
		char_y += string_height(string_char_at(text,char_index)) * text_size;
		char_x = 0;
	}
}



if char_index <= string_length(text){
	if Input_Check(INPUT.BACK,INPUT_STEAT.PRESSED) {//按x跳过
		for (var i = char_index;i < string_length;i ++){
            summon_char();
		}
	}else{
		time ++;
	}
    if time >= text_speed {//正常显示 
        summon_char();
		audio_play_sound(text_snd,0,false);
		time = 0;	
    }
}else {//打字完成后
	if can_destroy == true {//能被销毁
		if Input_Check(INPUT.CONFIRM,INPUT_STEAT.PRESSED){
			instance_destroy(self);
			if room_get_name(room) == "Room_BadEnd" {
				obj_badend.text_turn ++;
			}
		}
	}
}




