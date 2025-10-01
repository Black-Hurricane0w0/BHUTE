function BezierCreate(start_pos,end_pos){
    return new bezier(start_pos,end_pos);
}

/**
 * 创建一个贝塞尔曲线对象
 * @param {struct.vec2} _start_pos 起始点
 * @param {struct.vec2} _end_pos 结束点
 */
function bezier(_start_pos,_end_pos) constructor {
    start_pos = _start_pos;
    end_pos = _end_pos;
    controller = [];
    static type = "bezier";
    /**
     * 增加控制点
     * @param {Struct.vec2,Array<Struct.vec2>} pos 控制点坐标或包含控制点坐标的数组
     * @return {Struct.bezier}
     */
    static addcontroller = function (pos){
        if is_vec2(pos){
            array_push(controller,pos);
        }else if is_array(pos){
            for (var i = 0; i < array_length(pos); i++) {
            	if !is_vec2(pos[i]) {
                    show_error("addcontroller error:not a vec2 in array",false);
                }
                array_push(controller,pos[i]);
            } 
        }else{
            show_error("addcontroller error:not a array",false)
        }
        return self;
    }
    /**
     * 获取贝塞尔曲线上的点
     */
    static getpoint = function (t){
        t = clamp(t,0,1);
        var level = array_length(controller) + 1;
        //所有点的数组
        var allpoints = [start_pos];
        for (var i = 0; i < array_length(controller); i++) {
        	array_push(allpoints,controller[i]);
        }
        array_push(allpoints,end_pos);
        //按等次计算
        var resultpoints = [];
        while (level > 0) {
            for (var i = 0; i < array_length(allpoints) - 1; i++) {
            	resultpoints[i] = point_lerp(allpoints[i],allpoints[i+1],t);
            }
            level--;
            array_copy(allpoints,0,resultpoints,0,array_length(resultpoints))
        }
        return resultpoints[0];
    }
    /**
     * 设置起始点和结束点
     * @param {Struct.vec2} _start_pos 起始点
     * @param {Struct.vec2} _end_pos 结束点
     * @return {Struct.bezier}
     * @context BezierCreate
     */
    static set = function (_start_pos = self.start_pos,_end_pos = self.end_pos){
        self.start_pos = _start_pos;
        self.end_pos = _end_pos;
        return self;
    }
    static draw = function (){
        var l = floor(point_distance_vec(start_pos,end_pos));
        for (var i = 0; i < l; i++) {
        	draw_pos(self.getpoint(i/l));
        }
    }
}


/// @desc  类型检查函数
/// @param {any} obj  检查的对象
/// @returns {bool}  是否为bezier类型
function is_bezier(obj) {
    return is_struct(obj) && variable_struct_exists(obj, "type") && obj.type == "bezier";
}