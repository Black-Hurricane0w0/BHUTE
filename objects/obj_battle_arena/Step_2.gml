//不在战斗状态时不判定
if obj_battle.battle_state != BATTLE_STATE.ENEMY exit
var rot = degtorad(rotation);
//应用表面,长方形
	//计算坐标
    var len = sqrt(sqr((target_height)/2) + sqr((target_width)/2));
    //长方形边数为4，共4个顶点
    var point_count = 4;
    //记录所有顶点的数组
    point_array = array_create(0);
    var a = arctan(target_height/target_width);
    var p1 = new vec2(target_x + len*cos(rot-a),target_y - len*sin(rot-a));
    var p2 = new vec2(target_x + len*cos(rot+a),target_y - len*sin(rot+a));
    var p3 = new vec2(target_x + len*cos(rot-a+pi),target_y - len*sin(rot-a+pi));
    var p4 = new vec2(target_x + len*cos(rot+a+pi),target_y - len*sin(rot+a+pi));
    array_push(point_array,p1,p2,p3,p4);
    
    vec_array = array_create(point_count);
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
    var getpoints = function(){
        //获取玩家顶点
        var posx = obj_move_soul.pos.x;
        var posy = obj_move_soul.pos.y;
        //获取各个限制点坐标
        player_points = array_create(0);
        array_push(player_points,new vec2(posx+7,posy-7));
        array_push(player_points,new vec2(posx-7,posy-7));
        array_push(player_points,new vec2(posx,posy+8));
        array_push(player_points,new vec2(posx-8,posy+1));
        array_push(player_points,new vec2(posx+8,posy+1));
        array_push(player_points,new vec2(posx+5,posy-8));
        array_push(player_points,new vec2(posx-5,posy-8));
    }

    player_points = array_create(0);
    getpoints();
    for (var j=0;j<4;j++){
        for(var i=0;i<array_length(player_points);i++){
            //对灵魂数据更新
            getpoints();
            //选择高或宽
            var hw = (j mod 2 == 0?width:height) - 10;
            var rotj = rot + j*pi/2;
            //获得向量
            var vec = get_vector(pos,player_points[i]);
            //获取旋转角
            var s = vec.toGameMakerCoords().getdirection() - rotj;
            //获取平行向量
            var vec_2 = triangle_vec(rotj,vec.magnitude()*cos(s))
            //判断向量长度cos越界
            if (vec.magnitude()*cos(s)>hw/2){
                var vec_3 = triangle_vec(rotj + pi/2 ,vec.magnitude()*sin(s))
                var vec_4 = triangle_vec(rotj,hw/2);
                var end_pos = get_endpos(pos,vec_3.add(vec_4));
                var vec_5 = get_vector(player_points[i],end_pos).toGameMakerCoords();
                obj_move_soul.pos = get_endpos(obj_move_soul.pos,vec_5);
            }
        }
    }
    
    
