function Enemy_Dialogue_Add(text){
    var add = text;
    if is_string(text) {
        add = GetLangStruct(text)
    }
	ds_queue_enqueue(global._enemy_dialogue,text);
}