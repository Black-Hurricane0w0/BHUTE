time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,0,320,300,,false);
    //inst = ArenaCreateAddition(100,100,0,,ARENA_STATE.NOHIT);
    //inst2 = ArenaCreateAddition(100,100,0,,ARENA_STATE.NOHIT);
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
    
    
} 

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 

	if time mod 30 == 0 {
		//BoneRotCreate(200,320,1,0,40,40,0,0,c_white,0.5,ac_default,,0,0,true,infinity); 

        //var spawn_x = random_range(100,500);
    	//var spawn_y = random_range(100,400);
    	//var facing = point_direction(spawn_x,spawn_y,obj_move_soul.pos.x,obj_move_soul.pos.y);
    	//GB2Create(spawn_x,spawn_y,facing,1,40,20);
        BoneCustomCreate(320,180,c_white,false,function(){
            with(other){
                var dir = random(360);
                controller = new vec2(obj_move_soul.x + lengthdir_x(300,dir),obj_move_soul.y + lengthdir_y(300,dir))
                if time == 1 {
                    bz = BezierCreate(new vec2(x,y),new vec2(obj_move_soul.x,obj_move_soul.y)).AddController(controller);
                    bm = CreateAnim().add(60,0,1).anim(ac_bone_default).execute(function(t){
                        x = bz.GetPoint(t).x;y = bz.GetPoint(t).y;
                        //alpha = 1 - bm.time/30;
                    }).endfunction(function(t){
                        //bz = BezierCreate(new vec2(x,y),new vec2(0,0)).SummonEndPos(bz.GetEndDeriv(),100);
                        bz = BezierCreate(new vec2(x,y),new vec2(0,0)).SummonEndPos(bz.GetEndDeriv(),400);
                        bm.reset();
                    })
                }if time == 120 {
                    instance_destroy(self);
                }
                bm.run();
                rot++;
            }
        })
    }
    //ArenaSetAddition(inst,100,100,0,ARENA_STATE.INSIDE,mouse_x,mouse_y);
    //ArenaSetAddition(inst2,100,100,0,ARENA_STATE.OUTSIDE,room_width-mouse_x,room_height-mouse_y);
    if time == 720 {
        Battle_TurnEnd();
    }
    //log(bez.getpoint((time mod 60)/60))

}


