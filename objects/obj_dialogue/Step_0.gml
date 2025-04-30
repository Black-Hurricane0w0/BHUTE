
if Enemy_Dialogue_Size() > 0 {
	if not instance_exists(inst) {
		show_debug_message(text)
		inst = instance_create_depth(x,y,depth - 1,obj_text) {
			inst.text = Enemy_Dialogue_Get();
			inst.text_color = c_black;
			inst.text_font = fnt_enemy_dialogue;
			inst.can_destroy = true;
			inst.text_size = 1;
			inst.text_snd = snd_txtsans;
		}
	}
}else {
	if not instance_exists(inst) {
		instance_destroy(self);
	}
}