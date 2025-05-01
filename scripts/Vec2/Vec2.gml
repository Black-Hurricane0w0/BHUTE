/// @desc  创建一个向量或坐标（二维数据结构）,x轴正方向为右，y轴正方向为上
/// @param {real} [_x]=0  0  数据的x坐标，不指定则默认为0
/// @param {real} [_y]=0  0  数据的y坐标，不指定则默认为0
function vec2(_x = 0,_y = 0) constructor{
    x = _x;
    y = _y;
    static type = "vec2";
    /**
    *  获取向量的x/y分量
    * @param {Vector2} index
    * @return {real}
    */
    static get = function(index){
        if index == Vector2.X {
            return x;
        }else if index == Vector2.Y{
            return y;
        }else{
            throw ("The function \"vec2.get\" does not accept index other than Vector2.X or Vector2.Y");
        }
    }
    static set = function(_x,_y){
        self.x = _x;
        self.y = _y;
        return self;
    }
    static add = function(_vec){
        x += _vec.get(Vector2.X);
        y += _vec.get(Vector2.Y);
        return self;
    }
    static minus = function(_vec){
        x -= _vec.get(Vector2.X);
        y -= _vec.get(Vector2.Y);
        return self;
    }
    /**
    *  获取向量与另一向量的数量积
    * @param {Struct.vec2} _vec
    * @return {real}
    */
    static dotproduct = function(_vec){
        return x * _vec.get(Vector2.X) + y * _vec.get(Vector2.Y);
    }
    /**
    *  获取向量与另一向量的夹角
    * @param {Struct.vec2} _vec
    * @return {real}
    */
    static getangle = function(_vec){
        var dotproduct = self.dotproduct(_vec);
        var cosa = dotproduct / (self.magnitude() * _vec.magnitude());
        return arccos(cosa);
    }
    /**
    *  获取向量对于x正半轴的方向
    * @param {Struct.vec2} _vec
    * @return {real}
    */
    static getdirection = function(){
        var dotproduct = self.dotproduct(new vec2(1,0));
        if self.magnitude() == 0 return NaN
        var cosa = dotproduct / (self.magnitude());
        if y >= 0 {
            return arccos(cosa);
        }else{
            return 2*pi-arccos(cosa);
        }
    }
    /**
    * 使目标向量与实数相乘
    * @param {real} k
    * @return {Struct.vec2}
    */
    static multiple = function(k){
        return new vec2(x*k,y*k);
    }
    /**
    *  获取向量模长
    * @return {real}
    */
    static magnitude = function(){
        return sqrt(sqr(x)+sqr(y));
    }
    /**
    *  将向量单位化
    *@return {Struct.vec2}
    */
    static normalize = function(){
        var tx = x / self.magnitude();
        var ty = y / self.magnitude();
        return new vec2(tx,ty);
    }
    /**
    *  判断向量是否共线
    * @param {Struct.vec2} _vec
    * @return {bool}
    */
    static iscollinear = function(_vec){
        var v1x = x;
        var v1y = y;
        var v2x = _vec.get(0);
        var v2y = _vec.get(1);
        if v2x == 0 and v2y == 0{
            throw ("Vector 2 cannot be a zero vector");
        }
        if (v1x / v2x) == (v1y / v2y){
            return true;
        }else{
            return false;
        }
    }
    /**
    *  反转y值
    * @return {Struct.vec2}
    */
    static reservey = function(){
        return new vec2(x,-y);
    }
    /**
    *  判断向量是否相等
    * @param {Struct.vec2} _vec
    * @return {bool}
    */
    static equal = function(_vec){
        if _vec.get(Vector2.X) == x and _vec.get(Vector2.Y) == y {
            return true;
        }else{
            return false;
        }
    }
    toString = function() {
        return "{" + string(x) + "," + string(y) + "}";
    }
    // 在 vec2 结构体中添加转换方法
    static toGameMakerCoords = function() {
        return new vec2(self.x, -self.y); // 反转 Y 轴
    }
    
    static fromGameMakerCoords = function(gm_x, gm_y) {
        return new vec2(gm_x, -gm_y);    // 恢复数学坐标系
    }
}
/**
 *  用于获取坐标间的向量
 * @param {Struct.vec2} _pos1 起始坐标
 * @param {Struct.vec2} _pos2 终止坐标
 * @return {Struct.vec2}
 */
function get_vector(_pos1,_pos2){
    return new vec2(_pos2.get(Vector2.X)-_pos1.get(Vector2.X),_pos2.get(Vector2.Y)-_pos1.get(Vector2.Y));
}
/**
 *  获取向量中x/y值最小的向量
 * @param {Array<Struct.vec2>} array 存放vec2的数组
 * @param {real} index 判断x/y
 * @returns {struct}
 */
function get_min_vector(array,index){
    if typeof(array) != "array"{
        throw ("Function \"get_min_vector\" only accepts array types")
    }
    if (array_length(array) == 0) {
        throw "Function \"get_max_vector\" do not accept empty arrays";
    }
    var length = array_length(array);
    var _min = array[0];
    for(var i=0;i<length;i++){
        if compare_smaller_vector(_min,array[i],index) == array[i] {
            _min = array[i];
        }
    }
    return _min;
}
/**
 *  获取向量中x/y值最大的向量
 * @param {array<struct.vec2>} array 存放vec2的数组
 * @param {Vector2} index 判断x/y
 * @returns {struct}
 */
function get_max_vector(array,index){
    if typeof(array) != "array"{
        throw ("Function \"get_max_vector\" only accepts array types")
    }
    if (array_length(array) == 0) {
        throw "Function \"get_max_vector\" do not accept empty arrays";
    }
    var length = array_length(array);
    var _max = array[0];
    for(var i=0;i<length;i++){
        if compare_larger_vector(_max,array[i],index) == array[i] {
            _max = array[i];
        }
    }
    return _max;
}
/**
 *  比较两个数据的x/y的大小，并返回较大者
 * @param {struct.vec2} _vec1  第一个vec
 * @param {struct.vec2} _vec2  第二个vec
 * @param {real} index  判断x/y
 * @returns {struct}  
 */
function compare_larger_vector(_vec1,_vec2,index){
    if (!is_vec2(_vec1) or !is_vec2(_vec2)){
        throw ("Need struct.vec2")
    }
    if index != 0 and index != 1 throw ("The function \"compare_lager_vector\" does not accept index other than Vector2.X or Vector2.Y");
    if _vec1.get(index) >= _vec2.get(index){
        return _vec1;
    }else{
        return _vec2;
    }
}
/**
 *  比较两个数据的x/y的大小，并返回较小者
 * @param {struct.vec2} _vec1  第一个vec
 * @param {struct.vec2} _vec2  第二个vec
 * @param {real} index  判断x/y
 * @returns {struct}
 */
function compare_smaller_vector(_vec1,_vec2,index){
    if (!is_vec2(_vec1) or !is_vec2(_vec2)){
        throw ("Need struct.vec2")
    }
    if index != Vector2.X and index != Vector2.Y throw ("The function \"compare_smaller_vector\" does not accept index other Vector2.X or Vector2.Y");
    if _vec1.get(index) <= _vec2.get(index){
        return _vec1;
    }else{
        return _vec2;
    }
}
/**
 * 获取两点间距离
 * @param {Struct.vec2} _vec1 坐标1
 * @param {Struct.vec2} _vec2 坐标2
 * @return {real}
 */
function point_distance_vec(_vec1,_vec2){
    var vec = get_vector(_vec1,_vec2);
    return vec.magnitude();
}
/**
* 获取两点间方向
* @param {Struct.vec2} _vec1 坐标1
* @param {Struct.vec2} _vec2 坐标2
* @return {real}
*/
function point_direction_vec(_vec1,_vec2){
    var vec = get_vector(_vec1,_vec2);
    return vec.getdirection();
}

/**
 * 对一个vec2列表应用函数,返回对应的vec2/vec2列表
 * @param {Array<Struct.vec2>} array vec2列表
 * @param {Function} func 应用函数
 * @return {Array<Struct.vec2>,Struct.vec2}
 */
function application_vec(array,func){
    return_value = undefined;
    func(array);
    return return_value;
}
function reservey(vec){
    return new vec2(vec.x,-vec.y)
}
/// @desc  绘制向量箭头
/// @param {Struct.vec2} pos 
/// @param {Struct.vec2} vec 
function draw_vector(pos,vec) {
    var end_x = pos.x + vec.x;
    var end_y = pos.y + vec.y;
    draw_set_color(c_blue);
    draw_arrow(pos.x, pos.y, end_x, end_y,10);
    draw_set_color(c_white);
}
/// @desc  获取终点坐标
/// @param {Struct.vec2} pos 
/// @param {Struct.vec2} vec 
function get_endpos(pos,vec) {
    var gm_vec = vec.toGameMakerCoords();
    var end_x = pos.x + gm_vec.x;
    var end_y = pos.y + gm_vec.y;
    return new vec2(end_x,end_y);
}
function triangle_vec(rot,magnitude) {
    return new vec2(magnitude*cos(rot),magnitude*sin(rot));
}
/// @desc  绘制坐标
/// @param {Struct.vec2} pos 
function draw_pos(pos) {
    draw_set_color(c_blue);
    draw_circle(pos.x, pos.y,3,false);
    draw_set_color(c_white);
}



// 类型检查函数
function is_vec2(obj) {
    return is_struct(obj) && variable_struct_exists(obj, "type") && obj.type == "vec2";
}










