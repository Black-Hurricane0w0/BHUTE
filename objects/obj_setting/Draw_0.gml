
draw_set_font(fnt_mono);
draw_set_color(c_white);
draw_text_transformed(120,100,"音量",1.5,1.5,0);
draw_text_transformed(120 + 350,105,string(Setting_Read(real,"Volume")) + "%" ,1,1,0);
draw_text_transformed(120,160,"震动",1.5,1.5,0);
draw_text_transformed(120 + 350,165,Setting_Read(string,"Vibration")?"开启":"关闭",1,1,0);
draw_text_transformed(120,220,"雨",1.5,1.5,0);
draw_text_transformed(120 + 350,225,Setting_Read(string,"Raining")?"开启":"关闭" ,1,1,0);
draw_text_transformed(120,280,"闪电",1.5,1.5,0);
draw_text_transformed(120 + 350,285,Setting_Read(string,"Lightning")?"开启":"关闭",1,1,0);
draw_text_transformed(120,340,"音乐",1.5,1.5,0);
draw_text_transformed(120 + 350,345,Setting_Read(string,"Music")?"开启":"关闭",1,1,0);

if detailed_setting == false {
	switch (setting_choice) {
		case 0 : {
			draw_set_color(c_yellow);
			draw_text_transformed(120,100,"音量",1.5,1.5,0); 
			break;
		}
		case 1 : {
			draw_set_color(c_yellow);
			draw_text_transformed(120,160,"震动",1.5,1.5,0);
			break;
		}
		case 2 : {
			draw_set_color(c_yellow);
			draw_text_transformed(120,220,"雨",1.5,1.5,0);
			break;
		}
		case 3 : {
			draw_set_color(c_yellow);
			draw_text_transformed(120,280,"闪电",1.5,1.5,0);
			break;
		}
		case 4 : {
			draw_set_color(c_yellow);
			draw_text_transformed(120,340,"音乐",1.5,1.5,0);
			break;
		}
	}
}