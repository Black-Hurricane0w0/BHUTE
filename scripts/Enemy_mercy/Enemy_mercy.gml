function Enemy_mercy(enemy){
	if Enemy_Infor_Get("id",enemy).mercy >= 80 {
		return true;
	}
}