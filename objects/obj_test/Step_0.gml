time ++
if time == 1 {
	Player_SetSoul(false,270,true);
	ArenaSet(200,200,0,320,300,,false);
    Player_PosSet(320,320);
    Player_Show();

    
} 

if obj_battle.battle_state == BATTLE_STATE.ENEMY { 
	if time mod 60 == 0 {
		BoneRotCreate(200,320,1,0,40,40,0,0,c_white,0.5,ac_default,,0,0,true,infinity); 
        CreateFuncText(100,100,"a test for text",false,function(){
            with(other){
                draw_set_color(c_red);
    	        draw_set_font(fnt_mono);
                draw_text_transformed(x + sin(time),y + cos(time),self.text,self.text_size,self.text_size,0);
                if time >= 60 {
                    instance_destroy(self.text_printer);
                }
            }
        })
    }
    if time == 360 {
        Battle_TurnEnd();
    }
}
    