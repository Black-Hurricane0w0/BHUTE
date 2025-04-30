function Create_Text(x,y,depth,text,color = c_white,font = fnt_mono,size = 1,_speed = 2,snd = snd_text_sound,candestory = false){
	text_inst = instance_create_depth(x,y,depth,obj_text);//创建并接受id
	text_inst.text = text;
	text_inst.text_color = color;
	text_inst.text_font = font;//传递
	text_inst.text_size = size;
	text_inst.text_speed = _speed;
	text_inst.text_snd = snd;
	text_inst.can_destroy = candestory;
	return text_inst
}