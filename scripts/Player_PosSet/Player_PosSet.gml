/**
 * 设置战斗中决心位置
 * @param {real} x
 * @param {real} y
 */
function Player_PosSet(x,y){
    if obj_battle.battle_state == BATTLE_STATE.ENEMY{
        obj_move_soul.pos.x = x;
        obj_move_soul.pos.y = y;
    }
}