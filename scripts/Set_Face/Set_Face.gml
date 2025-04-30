function Set_Face(facestate){
	Enemy_Infor_Get("id").face_state = facestate;
	Enemy_Infor_Get("id").faceusing = 0;
	Enemy_Infor_Get("id").facestep = 0;
}