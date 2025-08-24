//闪电
if Setting_Read(real,"Lightning") == true{
	audio_play_sound(snd_lightning_bolt,0,false);
	instance_create_depth(0,0,0,obj_lightning);
}
alarm[0] = 5400; 

