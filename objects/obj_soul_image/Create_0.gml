image_xscale = 1;
image_yscale = 1;
image_index = 0;
image_alpha = 1;
image_speed = 0;
image_angle = obj_move_soul.dir + 90;
depth = DEPTH.SOUL;
audio_play_sound(snd_bell,0,false);
if global.soul_color == SOUL_STATE.RED {
	image_index = 0;
}else {
	image_index = 1;
}