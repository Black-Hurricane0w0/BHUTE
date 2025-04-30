function Get_Faceusing(facestate){
	var result = 0
	if facestate == FACE.ANGRY {
		result = 18;
	}
	if facestate == FACE.NOR_BLACK || facestate == FACE.NOR_SMALL_EYES || facestate == FACE.NOR_WHITE  {
		result = 11;
	}
	return result;
}