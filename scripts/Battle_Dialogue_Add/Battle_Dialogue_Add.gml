/**
 * @function Battle_Dialogue_Add
 * @description 向战斗对话框添加对话文本
 * @param {string|struct} text 对话文本或翻译结构体
 * 如果传入的是字符串，会自动转换为翻译结构体
 * 对话会被添加到对话队列中，按顺序显示
 * 对话显示由战斗系统自动处理
 */
function Battle_Dialogue_Add(text){
    if is_string(text) {
        ds_queue_enqueue(global._battle_dialogue,GetLangStruct(text));
    }else {
        ds_queue_enqueue(global._battle_dialogue,text);
    }
}