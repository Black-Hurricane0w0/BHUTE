
if Enemy_Dialogue_Size() > 0 {
	if not instance_exists(inst) {
        inst = CreateLangText(x,y,depth-1,Enemy_Dialogue_Get(),c_black,1,snd_txtsans,true)
		inst.text_font = GetLangFont();
		inst.text_size = 0.5;
        inst.x_newline = 600;
	}
}else {
	if not instance_exists(inst) {
		instance_destroy(self);
	}
}