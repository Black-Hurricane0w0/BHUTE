var xx = 320;
var yy = obj_battle_arena.y - obj_battle_arena.height/2 -10;
var scale = 2;

var center_pos = new vec2(xx+10*dsin(time),yy - 72 * scale -10*dsin(2*time))
var rpos = center_pos.add(new vec2(27 * scale,0).toGameMakerCoords());
var lpos = center_pos.add(new vec2(-27* scale,0).toGameMakerCoords());


draw_sprite_pos(spr_sans,0,lpos.x,lpos.y,rpos.x,rpos.y,320+27* scale,yy,320-27* scale,yy,1);
