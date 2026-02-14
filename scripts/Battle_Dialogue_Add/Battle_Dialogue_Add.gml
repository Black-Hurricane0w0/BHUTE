/**
 * @function Battle_Dialogue_Add
 * @description 向战斗对话框添加对话文本
 * @param {string|struct} _struct 对话文本或翻译结构体
 * 如果传入的是字符串，会自动转换为翻译结构体
 * 对话会被添加到对话队列中，按顺序显示
 * 对话显示由战斗系统自动处理
 */
function Battle_Dialogue_Add(_struct){
	ds_queue_enqueue(global._battle_dialogue,_struct);
}