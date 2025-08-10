
if Enemy_Dialogue_Size() > 0 {
	if not instance_exists(inst) {
		inst = instance_create_depth(x,y,depth - 1,obj_text) {
			inst.text = Enemy_Dialogue_Get();
			inst.text_color = c_black;
			inst.text_font = fnt_enemy_dialogue;
			inst.can_destroy = true;
			inst.text_size = 0.5;
			inst.text_snd = snd_txtsans;
            inst.x_newline = 600;
		}
	}
}else {
	if not instance_exists(inst) {
		instance_destroy(self);
	}
}