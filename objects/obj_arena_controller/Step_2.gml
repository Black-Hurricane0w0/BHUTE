//碰撞事件
    //不在战斗状态时不判定
    if obj_battle.battle_state != BATTLE_STATE.ENEMY exit;

for (var i = 0; i < array_length(mask_points); i++) {
	mask_points[i] = false;
}
//是否在原框中
var isInOrigin = false;
//原框id
var origin = mask;

with(obj_arena){ 
    if state == ARENA_STATE.NOHIT exit;
    var rot = degtorad(rotation);
    //应用表面,长方形
    	//计算坐标
        var len = sqrt(sqr((height)/2) + sqr((width)/2));
        //长方形边数为4，共4个顶点
        var point_count = 4;
        //记录所有顶点的数组
        point_array = array_create(0);
        var a = arctan(height/width);
        var p1 = new vec2(x + len*cos(rot-a),y - len*sin(rot-a));
        var p2 = new vec2(x + len*cos(rot+a),y - len*sin(rot+a));
        var p3 = new vec2(x + len*cos(rot-a+pi),y - len*sin(rot-a+pi));
        var p4 = new vec2(x + len*cos(rot+a+pi),y - len*sin(rot+a+pi));
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
        getpoints();
        for (var i=0;i<array_length(player_points);i++){
            var outside = false;
            for(var j=0;j<4;j++){
                //对灵魂数据更新
                getpoints();
                //选择高或宽
                var hw = (j mod 2 == 0?width:height) - 10;
                var rotj = rot + j*pi/2;
                //获得向量
                var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
                if vec.equal(new vec2(0,0)) exit;
                //获取旋转角
                var s = vec.getdirection() - rotj;
                //获取平行向量
                var vec_2 = triangle_vec(rotj,vec.magnitude()*cos(s)); 
                if (vec.magnitude()*cos(s)>hw/2) {
                    outside = true;
                } 
            }
            if outside == false{
                obj_arena_controller.mask_points[i] = true;
                if i == 0 {
                    if obj_arena_controller.mask == id isInOrigin = true;
                    obj_arena_controller.mask = id; 
                }
            }
        }
}
if isInOrigin == true mask = origin;


with(mask){
    //不判定
    if state == ARENA_STATE.NOHIT exit;
    var rot = degtorad(rotation);
    for (var i=0;i<array_length(player_points);i++){ 
        if obj_arena_controller.mask_points[i] == true continue;  
        for(var j=0;j<4;j++){ 
            //对灵魂数据更新
            getpoints();
            //选择高或宽
            var hw = (j mod 2 == 0?width:height) - 10;
            var rotj = rot + j*pi/2;
            //获得向量
            var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
            if vec.equal(new vec2(0,0)) exit; 
            //获取旋转角
            var s = vec.getdirection() - rotj;
            //获取平行向量
            var vec_2 = triangle_vec(rotj,vec.magnitude()*cos(s));
            //计算重力
            var f = 0;var xx = 0;var s2 = 0;var grav = new vec2();
            if obj_move_soul.is_gravity == true {
                //定义重力的向量
                switch (obj_move_soul.dir) { 
                    case 0: grav = new vec2(1,0);
                    case 90: grav = new vec2(0,1);
                    case 180: grav = new vec2(-1,0);
                    case 270: grav = new vec2(0,-1);
                }
                //获取摩擦u
                var u = tan(degtorad(obj_move_soul.friction_coefficent)); 
                //获取重力方向与平行向量间角度
                s2 = vec_2.getangle(grav);
                //获取摩擦力
                f = grav.magnitude() * cos(s2) * u;
                //获取下滑力
                xx = grav.magnitude() * sin(s2);
            }

            //对比下滑力和摩擦力,舍去大于45°
            var vecg = get_vector(pos,player_points[i].add(grav.toGameMakerCoords())).fromGameMakerCoords();
            if vecg.equal(new vec2(0,0)) exit; 
            if xx <= f and vecg.magnitude()*cos(s)>hw/2 {
                with(obj_move_soul){
                    is_onground = true;
                    friction_resistance = 0;
                    jump_state = 0;
                    gmove = 0;
                }
            }
            //跳过已经在框内的点
            //if obj_arena_controller.mask[0] == true continue; 
            //判断向量长度cos越界,完成位置修正
            if (vec.magnitude()*cos(s)>hw/2){
                var vec_3 = triangle_vec(rotj + pi/2 ,vec.magnitude()*sin(s))
                var vec_4 = triangle_vec(rotj,hw/2);
                var end_pos = get_endpos(pos,vec_3.add(vec_4));
                var vec_5 = get_vector(player_points[i],end_pos).toGameMakerCoords();
                obj_move_soul.pos = get_endpos(obj_move_soul.pos,vec_5); 
            }
        }
    }
}
