//碰撞遮罩长宽随战斗框大小变化而变化
image_xscale = target_width / 2;
image_yscale = target_height / 2;
image_angle = rotation;//角度



rightside = x + target_width / 2;
leftside = x - target_width / 2;
upside = y - target_height / 2;
downside = y + target_height / 2;


if target_height < 26 target_height = 26;
if target_width < 26 target_width = 26;

bm.update(,[x,y],[target_x,target_y]).run();
bm2.update(,[width,height],[target_width,target_height]).run();
bm3.update(,rotation,target_rotation).run();

pos = new vec2(x,y);
