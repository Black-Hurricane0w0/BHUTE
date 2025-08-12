function Enemy_Mercy(enemy){
	if Enemy_Infor_Get("id",enemy).mercy >= 80 {
		return true;
	}
}