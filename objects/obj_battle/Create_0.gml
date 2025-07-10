depth = DEPTH.UI_TOP;
randomise();
//绘画obj
instance_create_depth(0,0,DEPTH.UI_BUTTOM,obj_draw_ui)
//战斗选择 1:battle 2:act 3:item 4:mercy
battle_buttom_choice = 1;


//战斗按钮创建
instance_create_depth(87,620,DEPTH.BULLET,obj_fight_buttom);
instance_create_depth(240,620,DEPTH.BULLET,obj_act_buttom);
instance_create_depth(400,620,DEPTH.BULLET,obj_item_buttom);
instance_create_depth(555,620,DEPTH.BULLET,obj_mercy_buttom);
//战斗框创建
arena = instance_create_depth(320,320,DEPTH.ARENA,obj_battle_arena);

//选择器创建
instance_create_depth(87-39,620,DEPTH.SOUL,obj_soul)
//主角创建
instance_create_depth(320,240,DEPTH.SOUL,obj_move_soul)

battle_ui_dialogue = noone
battle_ui_dialogue_text = "大雨骤至"
battle_buttom_state = MENU.BUTTOM_CHOICE;
choice_time = 0;
battle_fight_over_time = 0;
battle_ui_dialogue_color = c_white;
battle_action_choice = 0;
battle_item_soul = 0;
battle_item_choice = 0;
alarm[0] = 900;
turn_time = 0;
turn_inst = noone;
battle_won = false;
global.soul_color = SOUL_STATE.RED;
global.music = noone;
player_target_health = File_Get(PLAYER_INFO.MAX_HP);
ui_enable = false
buttom_enable = false;
bm = CreateAnim().add(20,0,1).anim(ac_speeddown).execute(function(t){ 
    draw_sprite_ext(spr_battle_edge,0,580,267.5 + i *15,t+2,t+2,0,make_color_rgb(255,255,255-255*t),0.5+t*0.5);
})
bm2 = CreateAnim().add(20,1,0).anim(ac_speeddown).execute(function(t){ 
    draw_sprite_ext(spr_battle_edge,0,580,267.5 + i *15,t+2,t+2,0,make_color_rgb(255,255,255-255*t),0.5+t*0.5);
})
last_item_choice = 0;

//怪物
Enemy_Add(320,160,obj_test_enemy);
//战斗状态
battle_state = Enemy_Infor_Get("start_state");
//物品
Item_Add(obj_item);
Item_Add(obj_item);
Item_Add(obj_item);
Item_Add(obj_item);
Item_Add(obj_item);
Item_Add(obj_item);
Item_Add(obj_item);
Item_Add(obj_item);


fadein_inst = Black_FadeIn(320,240,10,0.05);

Part_System_Create();
Part_Type_Create();

global.debug_surface = -1;

