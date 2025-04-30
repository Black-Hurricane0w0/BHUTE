function TagGet(tag){
	var arr = array_create(0);
	for (i=0;i<instance_count;i++){
		var inst = instance_id[i];
		with (inst) {
			if variable_instance_exists(self,"tag") && self.tag == tag{
				array_push(arr,id);
			}
		}
	}
	return arr;
}