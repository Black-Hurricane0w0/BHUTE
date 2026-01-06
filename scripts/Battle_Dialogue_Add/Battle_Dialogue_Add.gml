/// @desc 根据翻译结构体追加战斗框对话文本
/// @param {any*} _struct 翻译结构体
function Battle_Dialogue_Add(_struct){
	ds_queue_enqueue(global._battle_dialogue,_struct);
}