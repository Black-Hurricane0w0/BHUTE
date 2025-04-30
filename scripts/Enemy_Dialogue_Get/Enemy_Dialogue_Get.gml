function Enemy_Dialogue_Get(){
	return ds_queue_dequeue(global._enemy_dialogue);
}