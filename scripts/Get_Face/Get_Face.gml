function Get_Face(facestate){
	var face = 0;
	switch (facestate) {
		case FACE.ANGRY : {
			face = spr_arm_angry_head;
			break;
		}
		case FACE.NOR_BLACK : {
			face = spr_arm_nor_black_head;
			break;
		}
		case FACE.NOR_SMALL_EYES : {
			face = spr_arm_nor_small_eyes_head;
			break;
		}
		case FACE.NOR_WHITE : {
			face = spr_arm_nor_white_head;
			break;
		}
		default : {
			face = spr_arm_nor_white_head;
		}
	}
	return face;
}