
draw_set_font(fnt_mono);
draw_set_color(c_white);
draw_set_valign(fa_middle);
if time == 1 {
    bm = CreateAnim().add(30,-120,120).anim(ac_speeddown);
    bm2 = CreateAnim().add(30,640 + 120,120 + 350).anim(ac_speeddown);
};
bm.run();
bm2.run();
draw_text_transformed(bm2.value + 30,100,string(Setting_Read(real,"Volume")) + "%" ,1,1,0);
draw_healthbar(bm2.value - 80,95,bm2.value,107,Setting_Read(real,"Volume"),c_black,c_white,c_white,0,false,true);
draw_text_transformed(bm2.value,160,Setting_Read(string,"Raining")?"开启":"关闭" ,1,1,0);
draw_text_transformed(bm2.value,220,Setting_Read(string,"Lightning")?"开启":"关闭",1,1,0);
draw_text_transformed(bm2.value,280,Setting_Read(string,"Music")?"开启":"关闭",1,1,0);
draw_text_transformed(bm2.value + 30,340,string(Setting_Read(real,"Music Volume")) + "%",1,1,0);
draw_healthbar(bm2.value - 80,340-5,bm2.value,340+7,Setting_Read(real,"Music Volume"),c_black,c_white,c_white,0,false,true);
draw_text_transformed(bm2.value + 30,400,string(Setting_Read(real,"Sound Effect Volume")) + "%",1,1,0);
draw_healthbar(bm2.value - 80,400-5,bm2.value,400+7,Setting_Read(real,"Sound Effect Volume"),c_black,c_white,c_white,0,false,true);
draw_text_transformed(bm2.value,460,Setting_Read(string,"Full screen startup")?"开启":"关闭",1,1,0);

var settinglist = ["总音量","雨","闪电","音乐","音乐音量","音效音量","启动游戏时全屏"]
for (var i = 0; i < array_length(settinglist); i++) { 
    draw_set_color(c_white);
    if setting_choice == i and detailed_setting == false {
        draw_set_color(c_yellow)
    }
    draw_text_transformed(bm.value,100 + i * 60,settinglist[i],1,1,0); 
}

draw_set_color(c_white);
draw_set_valign(fa_top);

