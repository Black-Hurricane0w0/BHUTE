/// @desc 增加决心的KR值
/// @param {real} value 增加的KR大小
function Player_Kr(value){
    if global.kr_enable == true{
        File_Set(PLAYER_INFO.KR,File_Get(PLAYER_INFO.KR) + value);
    }
}