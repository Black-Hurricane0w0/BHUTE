if obj_battle.ui_enable = true {
	//名字与等级
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_font(fnt_mars_nc);
	draw_text_transformed(x,y,string(File_Get(PLAYER_INFO.NAME)) + "   " + "LV" + string(File_Get(PLAYER_INFO.LV)),1,1,0);

	//hp字体
	draw_sprite(spr_hpname,0,x + 210,y + 10);

	//血条
		////红底
		//draw_set_color(c_red);
		//draw_rectangle(x + 241,y - 4,x + 241 + File_Get(PLAYER_INFO.MAX_HP) * 1.2,y +20,false);
		////黄血
		//draw_set_color(c_yellow);
		//draw_rectangle(x + 241,y - 4,x + 241 + File_Get(PLAYER_INFO.HP) * 1.2,y +20,false);
	
	
	//血条
		var point_hp = File_Get(PLAYER_INFO.HP)/File_Get(PLAYER_INFO.MAX_HP)
		//顶部
		//draw_sprite_part_ext(spr_hp_top,0,0,0,point_hp * 120,24,x + 261,y - 2,1.0,1,c_white,1);
		////底部
		//draw_sprite_ext(spr_hp_bottom,0,x + 251,y - 10,1.0,1,0,c_white,1);
		draw_set_color(c_red);
		draw_rectangle(x + 251,y,x + 251 + File_Get(PLAYER_INFO.MAX_HP) * 1.2,y + 20,false);
		draw_set_color(c_yellow);
		draw_rectangle(x + 251,y,x + 251 + File_Get(PLAYER_INFO.HP) * 1.2,y + 20,false);
        if global.kr_enable == true{
            draw_set_color(#FF00FF);
            draw_rectangle(x + 252 + (File_Get(PLAYER_INFO.HP) - File_Get(PLAYER_INFO.KR)) * 1.2,y,x + 251 + File_Get(PLAYER_INFO.HP) * 1.2,y + 20,false);
            draw_sprite(spr_kr,0,x + 251 + File_Get(PLAYER_INFO.MAX_HP) * 1.2 + 30,y+10)
        }
	
	//血量数字
	draw_set_color(c_white);
	draw_text(x + 251 + File_Get(PLAYER_INFO.MAX_HP) * 1.2 + 30 + 30,y,string_format(File_Get(PLAYER_INFO.HP),0,0)+" / "+string(File_Get(PLAYER_INFO.MAX_HP)));
}

