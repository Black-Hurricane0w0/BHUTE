
getpoints = function(){
    //获取玩家顶点
    var posx = obj_move_soul.pos.x
    var posy = obj_move_soul.pos.y
    //获取各个限制点坐标
    player_points = array_create(0);
    array_push(player_points,new vec2(posx,posy));
    array_push(player_points,new vec2(posx+7,posy-7));
    array_push(player_points,new vec2(posx-7,posy-7));
    array_push(player_points,new vec2(posx+1,posy+8));
    array_push(player_points,new vec2(posx-1,posy+8));
    array_push(player_points,new vec2(posx-8,posy+1));
    array_push(player_points,new vec2(posx+8,posy+1));
    array_push(player_points,new vec2(posx+5,posy-8));
    array_push(player_points,new vec2(posx-5,posy-8));
    array_push(player_points,new vec2(posx+5,posy+3));
    array_push(player_points,new vec2(posx-5,posy+3));
}
