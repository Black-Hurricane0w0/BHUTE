time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,0,320,300,,false);
    inst = ArenaCreateAddition(100,100,0,,ARENA_STATE.NOHIT);
    inst2 = ArenaCreateAddition(100,100,0,,ARENA_STATE.NOHIT);
    Player_PosSet(320,320);
    Player_Show();
    //CreateFuncText(320,200,"a test for text",false,function(){
        //with(other){
            //draw_set_color(c_red);
            //draw_set_font(fnt_mono);
            //var len = text_size * string_width(text) * (text_number - 7.5);
            //draw_text_transformed(text_printer.x + lengthdir_x(len,text_printer.time),text_printer.y + lengthdir_y(len,text_printer.time),self.text,self.text_size,self.text_size,text_printer.time);
        //}
    //})
    BoneCustomCreate(320,180,c_white,true,function(){
        with(other){
            var dir = point_direction(x,y,obj_move_soul.x,obj_move_soul.y);
            var dis = point_distance(x,y,obj_move_soul.x,obj_move_soul.y);
            point = new vec2(x + lengthdir_x(dis + 80,dir),y + lengthdir_y(dis + 80,dir));
            if time == 1 {
                bm = CreateAnim().add(30,[x,y],[point.x,point.y]).anim(ac_bone_speeddown).execute(function(t){
                    x = t[0];
                    y = t[1];
                    alpha = 1 - bm.time/30;
                }).endfunction(function(t){
                    bm.add(30,[x,y],[point.x,point.y]);
                    bm.reset();
                })
            }
            bm.run();
            rot = dir;
        }
    })
} 

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 

	if time mod 30 == 0 {
		//BoneRotCreate(200,320,1,0,40,40,0,0,c_white,0.5,ac_default,,0,0,true,infinity); 

        //var spawn_x = random_range(100,500);
    	//var spawn_y = random_range(100,400);
    	//var facing = point_direction(spawn_x,spawn_y,obj_move_soul.pos.x,obj_move_soul.pos.y);
    	//GB2Create(spawn_x,spawn_y,facing,1,40,20);
    }
    ArenaSetAddition(inst,100,100,0,ARENA_STATE.INSIDE,mouse_x,mouse_y);
    ArenaSetAddition(inst2,100,100,0,ARENA_STATE.OUTSIDE,room_width-mouse_x,room_height-mouse_y);
    if time == 720 {
        Battle_TurnEnd();
    }
}
    