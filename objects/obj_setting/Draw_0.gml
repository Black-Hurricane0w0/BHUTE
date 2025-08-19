
draw_set_font(fnt_mono);
draw_set_color(c_white);
if time == 1 {
    bm = CreateAnim().add(30,-60,120).anim(ac_speeddown);
    bm2 = CreateAnim().add(30,640 + 60,120 + 350).anim(ac_speeddown);
};
bm.run();
bm2.run();
draw_text_transformed(bm.value,100,"音量",1.5,1.5,0);
draw_text_transformed(bm2.value,105,string(Setting_Read(real,"Volume")) + "%" ,1,1,0);
draw_text_transformed(bm.value,160,"震动",1.5,1.5,0);
draw_text_transformed(bm2.value,165,Setting_Read(string,"Vibration")?"开启":"关闭",1,1,0);
draw_text_transformed(bm.value,220,"雨",1.5,1.5,0);
draw_text_transformed(bm2.value,225,Setting_Read(string,"Raining")?"开启":"关闭" ,1,1,0);
draw_text_transformed(bm.value,280,"闪电",1.5,1.5,0);
draw_text_transformed(bm2.value,285,Setting_Read(string,"Lightning")?"开启":"关闭",1,1,0);
draw_text_transformed(bm.value,340,"音乐",1.5,1.5,0);
draw_text_transformed(bm2.value,345,Setting_Read(string,"Music")?"开启":"关闭",1,1,0);

if detailed_setting == false {
	switch (setting_choice) {
		case 0 : {
			draw_set_color(c_yellow);
			draw_text_transformed(bm.value,100,"音量",1.5,1.5,0); 
			break;
		}
		case 1 : {
			draw_set_color(c_yellow);
			draw_text_transformed(bm.value,160,"震动",1.5,1.5,0);
			break;
		}
		case 2 : {
			draw_set_color(c_yellow);
			draw_text_transformed(bm.value,220,"雨",1.5,1.5,0);
			break;
		}
		case 3 : {
			draw_set_color(c_yellow);
			draw_text_transformed(bm.value,280,"闪电",1.5,1.5,0);
			break;
		}
		case 4 : {
			draw_set_color(c_yellow);
			draw_text_transformed(bm.value,340,"音乐",1.5,1.5,0);
			break;
		}
	}
}