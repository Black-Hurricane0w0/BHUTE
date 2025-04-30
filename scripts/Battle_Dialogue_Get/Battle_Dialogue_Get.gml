function Battle_Dialogue_Get(){
	return ds_queue_dequeue(global._battle_dialogue);
}