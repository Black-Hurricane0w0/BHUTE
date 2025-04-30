var x1 = pos_1.posx;
var y1 = pos_1.posy;
var x2 = pos_2.posx;
var y2 = pos_2.posy;
tspeed ++;


if color == c_red {
	draw_set_color(c_red);
	if tspeed > 2 {
		color = c_yellow;
		tspeed = 0;
	}
	
}
if color == c_yellow {
	draw_set_color(c_yellow);
	if tspeed > 2 {
		color = c_red;
		tspeed = 0;
	}
}
draw_line_width(x1,y1,x1,y2,1.2);
draw_line_width(x1,y1,x2,y1,1.2);
draw_line_width(x1,y2,x2,y2,1.2);
draw_line_width(x2,y1,x2,y2,1.2);
