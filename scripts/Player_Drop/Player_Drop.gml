/// @desc 使决心坠落，并触发坠落相关判定(此函数尽在重力状态下的灵魂可用)
/// @param {real} _speed 坠落速度
/// @param {real} dir 坠落方向（仅限0，90，180，270）
function Player_Drop(_speed,dir){
	obj_move_soul.dir = dir mod 360;
	with(obj_move_soul) {
		gmove = _speed;
		drop = true;
		jump_state = 2;
	}	
	
}