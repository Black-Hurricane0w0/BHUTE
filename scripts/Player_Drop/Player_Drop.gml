function Player_Drop(_speed,dir){
	obj_move_soul.dir = dir mod 360;
	with(obj_move_soul) {
		gmove = _speed;
		drop = true;
		jump_state = 2;
	}	
	
}