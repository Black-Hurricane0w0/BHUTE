
if x != target_x or !is_anim(bm1) {
    bm1 = CreateAnim().add(120,x,target_x).anim("speeddown");
    bm1.execute(function(t){
        x = t;
        if target_x != bm1.b {
            bm1 = -1;
        }
    }).run();
}
if y != target_y or !is_anim(bm2) {
    bm2 = CreateAnim().add(120,y,target_y).anim("speeddown");
    bm2.execute(function(t){
        y = t;
        if target_y != bm2.b {
            bm2 = -1;
        }
    }).run();
}



if global.soul_color == SOUL_STATE.RED {
	image_index = 0;
}else {
	image_index = 1;
}
if room = Room_Battle {
	if obj_battle.ui_enable == true {
		visible = true;
	}else {
		visible = false;
	}
}
