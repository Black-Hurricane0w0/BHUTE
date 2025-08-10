

text = "";//字符串

time = 0;//计时器

char_x = 0;
char_y = 0;
char_index = 1;//字符在字符串内的索引

//定义列表
char_list = ds_list_create();

//是否能被确认键销毁
can_destroy = false;

//属性
text_speed = 2;
text_font = fnt_mono;
text_color = c_white;
text_size = 1;
text_snd = snd_text_sound;
text_func = undefined;

x_newline = 560;