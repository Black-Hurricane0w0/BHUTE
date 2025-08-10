width = 575;
height = 140;
rotation = 0;
target_rotation = 0;
target_x = 320;
target_y = 320;
x = 320;
y = 320;
pos = new vec2(x,y)
surface_wide = global.surface_wide;
state = ARENA_STATE.INSIDE;
is_circle = false;
radius = 100;
target_radius = 320;
enable_collision = true;

target_width = 200;
target_height = 200;
depth = DEPTH.ARENA;
mask_index = spr_battle_edge;

mask_surface = -1;

bm = CreateAnim().add(30,[x,y],[target_x,target_y]).anim(ac_arena_move).execute(function(t){ 
    x = t[0];
    y = t[1];
}).listener(false,false,true,false);
bm2 = CreateAnim().add(30,[width,height],[target_width,target_height]).anim(ac_arena_move).execute(function(t){ 
    width = t[0];
    height = t[1];
}).listener(false,false,true,false);
bm3 = CreateAnim().add(30,rotation,target_rotation).anim(ac_arena_move).execute(function(t){ 
    rotation = t;
}).listener(false,false,true,false);
//圆的大小曲线
bm4 = CreateAnim().add(30,radius,target_radius).anim(ac_arena_move).execute(function(t){ 
    radius = t;
}).listener(false,false,true,false);


player_points = array_create(0);


function getpoints(){
    //获取玩家顶点
    var posx = obj_move_soul.pos.x
    var posy = obj_move_soul.pos.y
    //获取各个限制点坐标
    player_points = array_create(0);
    var pos = new vec2(posx,posy)
    array_push(player_points,pos);
    var dir = degtorad(obj_move_soul.dir);
    array_push(player_points,triangle_vec(dir,8).toGameMakerCoords().add(pos));
    array_push(player_points,triangle_vec(dir + pi/2 + arctan2(8,7),sqrt(64+49)).toGameMakerCoords().add(pos));
    array_push(player_points,triangle_vec(dir - pi/2 - arctan2(8,7),sqrt(64+49)).toGameMakerCoords().add(pos));
    array_push(player_points,triangle_vec(dir + pi/2 + arctan2(-1,8),sqrt(65)).toGameMakerCoords().add(pos));
    array_push(player_points,triangle_vec(dir - pi/2 - arctan2(-1,8),sqrt(65)).toGameMakerCoords().add(pos));
    array_push(player_points,triangle_vec(dir + pi/2 + arctan2(-4,5),sqrt(25+20)).toGameMakerCoords().add(pos));
    array_push(player_points,triangle_vec(dir - pi/2 - arctan2(-4,5),sqrt(25+20)).toGameMakerCoords().add(pos));
    array_push(player_points,triangle_vec(dir + pi/2 + arctan2(5,3),sqrt(25+9)).toGameMakerCoords().add(pos));
    array_push(player_points,triangle_vec(dir - pi/2 - arctan2(5,3),sqrt(25+9)).toGameMakerCoords().add(pos));

}
