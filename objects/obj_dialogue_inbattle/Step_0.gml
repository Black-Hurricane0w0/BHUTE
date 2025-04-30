time ++
if not instance_exists(inst) {
	inst = instance_create_depth(x,y,depth - 1,obj_text) {
		inst.text = text;
		inst.text_color = text_color;
		inst.text_font = text_font;
		inst.can_destroy = can_destroy;
		inst.text_size = text_size;
		inst.text_snd = text_snd;
		inst.text_speed = text_speed;
	}
}
if time >= maxtime && maxtime >= 0 {
	instance_destroy(self);
	instance_destroy(inst);
}