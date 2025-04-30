
if obj_battle.battle_state == BATTLE_STATE.ENEMY {
	if is_gravity == false {
		image_angle = 0;
		image_index = 0;
		if Input_Check(INPUT.UP,INPUT_STEAT.KEEP) {
			if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
				y -= move_speed * 0.5;
			}else {
				y -= move_speed;
			}
		}
		if Input_Check(INPUT.DOWN,INPUT_STEAT.KEEP) {
			if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
				y += move_speed * 0.5;
			}else {
				y += move_speed;
			}
		}
		if Input_Check(INPUT.LEFT,INPUT_STEAT.KEEP) {
			if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
				x -= move_speed * 0.5;
			}else {
				x -= move_speed;
			}
		}
		if Input_Check(INPUT.RIGHT,INPUT_STEAT.KEEP) {
			if Input_Check(INPUT.BACK,INPUT_STEAT.KEEP) {
				x += move_speed * 0.5;
			}else {
				x += move_speed;
			}
		}
		is_onground = false;
		onplatform = false;
	}
}

if invulnerable > 0 {
	invulnerable --;
	if invulnerable mod 5 == 0 and invulnerable > 1 {
		if image_alpha == 1 {
			image_alpha = 0;
		}else{
			image_alpha = 1;
		}
	}
}else {
	image_alpha = 1;
}
y -= move_speed