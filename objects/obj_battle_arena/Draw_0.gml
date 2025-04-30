if obj_battle.ui_enable == true {
	//白虚假的
	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2,height / 2,rotation,c_white,1);
	//黑边虚假的
	draw_sprite_ext(spr_battle_edge,false,x,y,width / 2 - 5,height / 2 - 5,rotation,c_black,1);

    var rot = degtorad(rotation);
	
	//surface_set_target(mask_surface)
	//draw_rectangle(0,0,mouse_x,mouse_y,false)
	//surface_reset_target()
	//draw_surface_part(mask_surface,x - width / 2 + 5 ,y - height / 2 + 5 ,width - 10,height - 10,x - width / 2 + 5 ,y - height / 2 + 5);
	//应用表面,长方形
        //列表清空
        limit_pointsx = array_create(0);
        limit_pointsy = array_create(0);
        array_push(limit_pointsx,new vec2(640,240),new vec2(0,240));
        array_push(limit_pointsy,new vec2(320,480),new vec2(320,0));
        
        array_push(limit_pointsx,new vec2(640,0),new vec2(0,0),new vec2(640,480),new vec2(0,480));
		//计算坐标
        var len = sqrt(sqr((target_height-8)/2) + sqr((target_width-8)/2));
        //长方形边数为4，共4个顶点
        var point_count = 4;
        //记录所有顶点的数组
        var point_array = array_create(0);
        var a = arctan(target_height/target_width);
        var p1 = new vec2(target_x + len*cos(rot-a),target_y - len*sin(rot-a));
        var p2 = new vec2(target_x + len*cos(rot+a),target_y - len*sin(rot+a));
        var p3 = new vec2(target_x + len*cos(rot-a+pi),target_y - len*sin(rot-a+pi));
        var p4 = new vec2(target_x + len*cos(rot+a+pi),target_y - len*sin(rot+a+pi));
        array_push(point_array,p1,p2,p3,p4);
    
        var vec_array = array_create(point_count);
        //获取向量
        for (var i=0;i<point_count;i++){
            var vec = new vec2();
            if (i = point_count - 1){
                vec = get_vector(point_array[i],point_array[0]).toGameMakerCoords();
            }else {
                vec = get_vector(point_array[i],point_array[i+1]).toGameMakerCoords();
            }
            array_set(vec_array,i,vec);
        }
        //获取各个限制点坐标
        var posx = obj_move_soul.x;
        var posy = obj_move_soul.y;
        //获取玩家顶点
        var player_points = array_create(0);
        array_push(player_points,new vec2(posx+7,posy-7));
        array_push(player_points,new vec2(posx-7,posy-7));
        array_push(player_points,new vec2(posx,posy+8));
        for (var j=0;j<4;j++){
            for(var i=0;i<array_length(player_points);i++){
                //选择高或宽
                var hw = j mod 2 == 0?width:height;
                var rotj = rot + j*pi/2;
                //获得向量
                var vec = get_vector(pos,player_points[i]);
                //获取旋转角
                var s = vec.toGameMakerCoords().getdirection() - rotj;
                //获取平行向量
                var vec_2 = triangle_vec(rotj,vec.model()*cos(s))
                //判断向量长度cos越界
                if (vec.model()*cos(s)>hw/2){
                    var vec_3 = triangle_vec(rotj + pi/2 ,vec.model()*sin(s))
                    var vec_4 = triangle_vec(rotj,hw/2);
                    var end_pos = get_endpos(pos,vec_3.add(vec_4));
                    var vec_5 = get_vector(player_points[i],end_pos).toGameMakerCoords();
                    obj_move_soul.x = get_endpos(obj_move_soul.pos,vec_5).get(Vector2.X);
                    obj_move_soul.y = get_endpos(obj_move_soul.pos,vec_5).get(Vector2.Y);
                }
            }
        }
        
        
            
        
        
}








