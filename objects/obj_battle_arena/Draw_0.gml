if obj_battle.ui_enable == true {
    //白边
	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2,height / 2,rotation,c_white,1);
	//黑边虚假的
	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2 - 5,height / 2 - 5,rotation,c_black,1);

    
	
	
	//绘制遮罩
    for (var i = point_array[0].x;abs(i-point_array[2].x)>=1;i+=sign(point_array[2].x-i)){
        //获取边缘向量
        var uppoint_array = array_create(0);
        var downpoint_array = array_create(0);
        //获取y分界值
        var yy = get_endpos(point_array[0],get_vector(point_array[0],point_array[2]).multiple((i-point_array[0].x)/(point_array[2].x-point_array[0].x)).toGameMakerCoords()).get(Vector2.Y);
        for (var j = 0; j < 4; j++) {
            var vec = new vec2();
            if j == 3 {
                vec = vec_array[j].multiple((i-point_array[j].x)/(point_array[0].x-point_array[j].x));
            }else{
                vec = vec_array[j].multiple((i-point_array[j].x)/(point_array[j+1].x-point_array[j].x));
            }
            //获得终点坐标
            var endpos = get_endpos(point_array[j],vec)
            
            if (endpos.y < yy) {
                array_push(uppoint_array,endpos);
            }else {
                array_push(downpoint_array,endpos);
            }
            
        }
        //获取上下坐标
        var _up = get_max_vector(uppoint_array,Vector2.Y);
        var _down = get_min_vector(downpoint_array,Vector2.Y);
        //绘制
	    draw_surface_part(mask_surface,_up.x,_up.y,1,_down.y-_up.y,_up.x,_up.y);
    }
    
        
        
        
}








