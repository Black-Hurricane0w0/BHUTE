/// @desc 设置回合的对象（一般在回合结束后执行）
/// @param {Asset.GMObject} obj 回合对象
function Battle_TurnSet(obj){
	if object_exists(obj){
		obj_battle.turn_inst = obj;
	}
}