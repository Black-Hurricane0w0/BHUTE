//碰撞事件
    //不在战斗状态时不判定
    if obj_battle.battle_state != BATTLE_STATE.ENEMY exit;


var origin_mask = mask; 
//重力遮罩初始化
obj_arena.getpoints()
for (var i = 0; i < array_length(obj_arena.player_points); i++) {
	grav_mask[i] = [];
    mask_points[i] = false;
}
mask = [];
//定义重力的向量
var grav = new vec2();
switch (obj_move_soul.dir) { 
    case 0: 
        grav = new vec2(1,0);
        break;
    case 90: 
        grav = new vec2(0,1);
        break;
    case 180: 
        grav = new vec2(-1,0);
        break;
    case 270: 
        grav = new vec2(0,-1);
        break;
    default:
        grav = new vec2(0,-1);
}


//所有框初始化
with(obj_arena){
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
}

//outside框排除
with(obj_arena){
    if state != ARENA_STATE.OUTSIDE continue; 
        
    var rot = degtorad(rotation);
    getpoints();
    for (var i=0;i<array_length(player_points);i++){ 
            getpoints();
            if is_circle == false {
                var inside = true;
                var maxlen = new vec2(0,0);
                var rott = rot;
                var hwt = width;
                var maxlenm = 0;
                for(var j=0;j<4;j++){ 
                    //选择高或宽
                    var hw = (j mod 2 == 0?width:height);
                    var rotj = rot + j*pi/2;
                    //获得向量
                    var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
                    if vec.equal(new vec2(0,0)) {
                        rott = rotj;
                        hwt = hw;
                        inside = true;
                        break;
                    }
                    //获取旋转角    
                    var s = vec.getdirection() - rotj;
                    var vecm = vec.magnitude()*cos(s);
                    //获取平行向量
                    var vec_2 = triangle_vec(rotj,vec.magnitude()*cos(s)).multiple(-1);
                    //判断是否在内
                    if (vecm >= hw/2){
                        inside = false;
                        break;
                    }
                    //判断向量长度cos越界,完成位置修正
                    if (vecm < hw/2) and (vecm > 0) and (vecm/hw > maxlenm/hwt){
                        maxlen = vec;
                        rott = rotj;
                        hwt = hw;
                        maxlenm = maxlen.magnitude()*cos(s)
                    } 
                }
                if inside == false continue;
                var s = 0;
                
                if maxlen.equal(new vec2(0,0)) {
                    s = random_range(0,2*pi);
                }else{
                    s = maxlen.getdirection() - rott;
                }
                var vec_3 = triangle_vec(rott + pi/2 ,maxlen.magnitude()*sin(s))
                var vec_4 = triangle_vec(rott,hwt/2);
                var end_pos = get_endpos(pos,vec_3.add(vec_4));
                var vec_5 = get_vector(player_points[i],end_pos).toGameMakerCoords();
                obj_move_soul.pos = get_endpos(obj_move_soul.pos,vec_5); 
            }else{//圆形判断
                //获得向量 
                var vec = get_vector(pos,player_points[i]).fromGameMakerCoords(); 
                if vec.equal(new vec2(0,0)) {
                    continue;
                }
                //判断
                if vec.magnitude() >= radius {
                    continue;
                }
                
                //获取新向量
                var vec_2 = vec.normalize().multiple(radius);
                var vec_3 = vec_2.minus(vec);
                obj_move_soul.pos = get_endpos(obj_move_soul.pos,vec_3); 
            }
    }
    if obj_move_soul.is_gravity == false continue;
    for (var i=0;i<array_length(player_points);i++){ 
        if is_circle == false{
            for(var j=0;j<4;j++){
                //选择高或宽
                var hw = (j mod 2 == 0?width:height);
                var rotj = rot + j*pi/2;
                //获得向量
                var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
                if vec.equal(new vec2(0,0)) {
                    break;
                }
                //获取旋转角    
                var s = vec.getdirection() - rotj;
                var vecm = vec.magnitude()*cos(s);
                //获取平行向量
                var vec_2 = triangle_vec(rotj,vec.magnitude()*cos(s)).multiple(-1);
                //计算重力
                var f = 0;var xx = 0;var s2 = 0;
                if obj_move_soul.is_gravity == true {
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
                if vecg.equal(new vec2(0,0)) break;
                    
                var vecgcos = vecg.magnitude()*cos(s);
                var wh = (j mod 2 == 0?height:width);
                if xx <= f and vecgcos < hw/2 and vecgcos > 0 and abs(vec.magnitude()*sin(s)) < wh/2 {//s作为近似角度
                    obj_move_soul.is_onground = true;
                    obj_move_soul.jump_state = 0;
                    obj_move_soul.gmove = 0;
                }
            }    
        }else{
           //获得向量 
           var vec = get_vector(pos,player_points[i]).fromGameMakerCoords(); 
           if vec.equal(new vec2(0,0)) break;
           //获取夹角
           var s = vec.getangle(grav.reservey());
           
           var vecg = get_vector(pos,player_points[i].add(grav.normalize().toGameMakerCoords())).fromGameMakerCoords(); 
           if vecg.equal(new vec2(0,0)) break;
           //判断
           if vecg.magnitude() < radius and abs(s) <= degtorad(obj_move_soul.friction_coefficent) {
                obj_move_soul.is_onground = true;
                obj_move_soul.jump_state = 0;
                obj_move_soul.gmove = 0;
           }
        }
    }
}

//inside框遮罩判断
with(obj_arena){ 
    var rot = degtorad(rotation);
    if state != ARENA_STATE.INSIDE continue;
    getpoints();
    for (var i=0;i<array_length(player_points);i++){
        var outside = false;
        if is_circle == false{ //矩形判断
            for(var j=0;j<4;j++){
                getpoints();
                //选择高或宽
                var hw = (j mod 2 == 0?width:height) - 10;
                var rotj = rot + j*pi/2;
                //获得向量
                var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
                if vec.equal(new vec2(0,0)) {
                    outside = false;
                    break;
                }
                //获取旋转角
                var s = vec.getdirection() - rotj;
                //获取平行向量
                var vec_2 = triangle_vec(rotj,vec.magnitude()*cos(s)); 
                if (vec.magnitude()*cos(s)>hw/2) {
                    outside = true;
                    break;
                }
            }
        }else{//圆形判断
            //获得向量 
            var vec = get_vector(pos,player_points[i]).fromGameMakerCoords(); 
            //判断
            if vec.magnitude() > radius-5 {
                outside = true;
            }
        }
        if outside == false{
            if !array_contains(obj_arena_controller.mask,id) {
                array_push(obj_arena_controller.mask,id);
            }
            obj_arena_controller.mask_points[i] = true;
        }
        
    }
}



if array_length(mask) <= 0 mask = origin_mask;

for (var i=0;i<array_length(obj_arena.player_points);i++){
    var move_vec_array = [];
    for (var k = 0; k < array_length(mask); k++) {
        var move_vec = new vec2(0,0);
    	with(mask[k]){
            getpoints();
            if is_circle == false{
                var rot = degtorad(rotation);
                for(var j=0;j<4;j++){ 
                    //选择高或宽
                    var hw = (j mod 2 == 0?width:height) - 10;
                    var rotj = rot + j*pi/2;
                    //获得向量
                    var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
                    if vec.equal(new vec2(0,0)) break; 
                    //获取旋转角    
                    var s = vec.getdirection() - rotj;
            
                    //判断向量长度cos越界,完成位置修正
                    if (vec.magnitude()*cos(s)>hw/2){
                        var vec_3 = triangle_vec(rotj + pi/2 ,vec.magnitude()*sin(s))
                        var vec_4 = triangle_vec(rotj,hw/2);
                        var end_pos = get_endpos(pos,vec_3.add(vec_4));
                        var vec_5 = get_vector(player_points[i],end_pos)
                        move_vec = move_vec.add(vec_5);
                    }
                }
            }else {
                //获得向量
                var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
                if vec.magnitude() <= radius - 5 continue;
                
                //获取新向量
                var vec_2 = vec.normalize().multiple(radius-5);
                var vec_3 = vec_2.minus(vec);
                
                move_vec = move_vec.add(vec_3).fromGameMakerCoords();
            }
        }
        array_push(move_vec_array,move_vec);
    }
    var final_vec = application_vec(move_vec_array,function(arr){
        var _min = arr[0];
        for (var i = 0; i < array_length(arr); i++) {
        	if arr[i].magnitude() < _min.magnitude() {
                _min = arr[i];
            }
        }
        return_value = _min;
    })
    obj_move_soul.pos = get_endpos(obj_move_soul.pos,final_vec.toGameMakerCoords()); 
} 




//增框判断重力模块
if obj_move_soul.is_gravity == false exit;

if obj_move_soul.is_onground == true exit;
var onground = false;


//对灵魂数据更新
obj_arena.getpoints();
with(obj_arena){ 
    var rot = degtorad(rotation);
        if state != ARENA_STATE.INSIDE continue;
        getpoints();
        if is_circle == false { 
            for (var i=0;i<array_length(player_points);i++){
                var outside = false;
                for(var j=0;j<4;j++){
                    getpoints();
                    //选择高或宽
                    var hw = (j mod 2 == 0?width:height) - 10;
                    var rotj = rot + j*pi/2;
                    //获得向量
                    var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
                    if vec.equal(new vec2(0,0)) {
                        break;
                    }
                    //获取旋转角
                    var s = vec.getdirection() - rotj;
                    //获取平行向量
                    var vec_2 = triangle_vec(rotj,vec.magnitude()*cos(s)); 
                    if (vec.magnitude()*cos(s)>hw/2) {
                        outside = true;
                        break;
                    }
                }
                if outside == false{
                    array_push(obj_arena_controller.grav_mask[i],id); 
                }
            }
        }else{//圆形判断
            for (var i=0;i<array_length(player_points);i++){
                //获得向量 
                var vec = get_vector(pos,player_points[i]).fromGameMakerCoords(); 
                //判断
                if vec.magnitude() <= radius-5 {
                    array_push(obj_arena_controller.grav_mask[i],id); 
                }
            }
        }
}


for (var i = 0; i < array_length(obj_arena.player_points);i++) {
    var boolarray = [];
    var allin = true;
    for (var k = 0; k < array_length(grav_mask[i]); k++) { 
        with(grav_mask[i][k]){
            boolarray[k] = false; 
            if is_circle == false {
                for (var j = 0; j < 4; j++) { 
                    var rot = degtorad(rotation);
                    //选择高或宽
                    var hw = (j mod 2 == 0?width:height) - 10;
                    var rotj = rot + j*pi/2;
                    //获得向量
                    var vec = get_vector(pos,player_points[i]).fromGameMakerCoords();
                    if vec.equal(new vec2(0,0)) break; 
                    //获取旋转角
                    var s = vec.getdirection() - rotj;
                    //获取平行向量
                    var vec_2 = triangle_vec(rotj,vec.magnitude()*cos(s));
                    //计算重力
                    var f = 0;var xx = 0;var s2 = 0;
                    if obj_move_soul.is_gravity == true {
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
                    if vecg.equal(new vec2(0,0)) break;
                    if xx <= f and vecg.magnitude()*cos(s)>hw/2 {
                        boolarray[k] = true;
                    }
                }  
            }else{
                //获得向量 
                var vec = get_vector(pos,player_points[i]).fromGameMakerCoords(); 
                if vec.equal(new vec2(0,0)) break;
                //获取夹角
                var s = vec.getangle(grav);
                
                var vecg = get_vector(pos,player_points[i].add(grav.normalize().toGameMakerCoords())).fromGameMakerCoords(); 
                if vecg.equal(new vec2(0,0)) break;
                //判断
                if vecg.magnitude() > radius-5 and abs(s) <= degtorad(obj_move_soul.friction_coefficent) {
                    boolarray[k] = true;
                }
            }
        }
    }
    for (var k = 0; k < array_length(boolarray); k++) {
    	if boolarray[k] != true{
            allin = false;
            break;
        }
    }
    if allin == true {
        onground = true;
        break;
    }
}

with(obj_move_soul){
    if onground == true {
        is_onground = true;
        jump_state = 0;
        gmove = 0;
    }
}


