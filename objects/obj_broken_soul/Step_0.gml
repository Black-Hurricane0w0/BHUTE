time ++;
if time == 30 {
	audio_play_sound(snd_soul_break1,0,false);
    if global.soul_color == SOUL_STATE.RED {
        image_index = 2;
    }else{
        image_index = 3;
    }
}


if time == 90 {
    if global.soul_color == SOUL_STATE.RED {
        Part_Type_Set(spr_broken_soul_red,0.4,c_white,1,4,6,200,260,0,180,0.125);
    }else {
    	Part_Type_Set(spr_broken_soul_blue,0.4,c_white,1,4,6,200,260,0,180,0.125);
    } 
	part_particles_create(global._part_system,x,y,global._part_type,6);
	audio_play_sound(snd_soul_break2,0,false);
	instance_destroy();
}