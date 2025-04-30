time ++;
if time == 30 {
	audio_play_sound(snd_soul_break1,0,false);
	image_index = 2;

}


if time == 90 {
	Part_Type_Set(spr_broken_soul_red,0.4,c_white,1,4,6,200,260,0,180,0.125);
	part_particles_create(global._part_system,x,y,global._part_type,6);
	audio_play_sound(snd_soul_break2,0,false);
	instance_destroy();
}