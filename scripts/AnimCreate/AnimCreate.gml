/// @desc 创建一个animcontroller
/// @returns {Struct.anim} 
function CreateAnim(){
    return new anim();
}

function anim() constructor {
    maxtime = 0;
    time = 0;
    a = 0;
    b = 0;
    value = 0;
    f = undefined;
    ef = undefined;
    _anim = animcurve_get_channel(animcurve_get(ac_default),0)
    static type = "animcontroller";
    data_type = "int";
    listen_bool = [false,false,false,false];
    /**
     * @param {real} maxtime 最大时间
     * @param {real,Array} a 初始值
     * @param {real,Array} b 结束值
     * @return {Struct.anim}
    */
    static add = function(maxtime,a,b){
        self.maxtime = maxtime;
        self.a = a;
        self.b = b;
        if is_array(a) and is_array(b) {
            data_type = "array";
            if array_length(a) != array_length(b) {
                show_error("The length of the array must be the same first",true)
            }
            value = array_create(array_length(a));
        }
        if (is_array(a) and !is_array(b)) || (is_array(b) and !is_array(a)) {
            show_error("anim data must be of the same type",true)
        }
        return self;
    }
    /**
     * @description 运行动画
     * @return {Struct.anim}
    */
    static run = function(){
        time++;
        var t = time > maxtime?1:animcurve_channel_evaluate(_anim,time/maxtime);
        if data_type == "int" {
            value = a + (b - a) * t;
        }else{
            for (var i = 0; i < array_length(self.a); i++) {
            	value[i] = a[i] + (b[i] - a[i]) * t;
            }
        }
        if f != undefined {
            f(value); 
        }
        if time == maxtime and ef != undefined {
            ef(value);
        }
        return self;
    }
    /**
     * 执行一个函数,参数为real
     * @param {Function} f 要执行的函数（附带一个形参）
     * @return {Struct.anim}
    */
    static execute = function(f){
        self.f = f;
        return self;
    }
    /**
     * 设置动画类型
     * @param {GMAnimCurve} animname
     * @return {Struct.anim}
    */
    static anim = function(animname){
        if animcurve_exists(animname){
            _anim = animcurve_get_channel(animname,0);
        }else {
            _anim = animcurve_get_channel(ac_default,0);
        }
        return self;
    }
    /**
     * 监听触发时更新数据
     * @param {real} [maxtime] 最大时间
     * @param {real,Array} [a] 初始值
     * @param {real,Array} [b] 结束值
     * @param {GMAnimCurve} _anim 动画类型
     * @return {Struct.anim}
    */
    static update = function(maxtime = self.maxtime,a = self.a,b = self.b,_anim = self._anim){
        var update = false;
        var check = [maxtime,a,b,_anim];
        var listen = [self.maxtime,self.a,self.b,self._anim];
        for (var i = 0; i < 4; i++) {
        	if listen_bool[i] == true {
                if data_type == "int" and listen[i] != check[i]{
                    update = true;
                }else if data_type == "array" and !array_equals(listen[i],check[i]){
                    update = true;
                }
            }
        }
        if update == true {
            self.time = 0;
            self.maxtime = maxtime;
            if data_type == "int" { 
                self.a = a;
                self.b = b;
            }else{
                array_copy(self.a,0,a,0,array_length(a));
                array_copy(self.b,0,b,0,array_length(b));
            }
            self._anim = _anim;
            self.value = a;
        }
        return self;
    }
    /**
     * 监听数值是否改变，和update()函数一起使用
     * @param {bool} [maxtime] 是否监听最大动画时间
     * @param {bool} [a] 是否监听起始值
     * @param {bool} [b] 是否监听结束值
     * @param {bool} [_anim] 是否监听动画类型
     * @return {Struct.anim}
    */
    static listener = function(maxtime = false,a = false,b = false,_anim = false){
        listen_bool = [maxtime,a,b,_anim];
        return self;
    }
    /**
     * 重置动画
     * @return {Struct.anim}
     * @self CreateAnim
     */
    static reset = function(){
        self.time = 0;
        if data_type = "int" {
            self.value = a;
        }else {
            array_copy(self.value,0,self.a,0,array_length(self.a));
        }
        return self;
    }
    /**
     * 结束动画
     * @return {Struct.anim}
     * @self CreateAnim
     */
    static finish = function(){
        self.time = maxtime;
        if data_type = "int" {
            self.value = b;
        }else {
            array_copy(self.value,0,self.b,0,array_length(self.b));
        }
        return self;
    }
    /**
     * 计时器结束时执行函数,参数为real
     * @param {Function} f 要执行的函数（附带一个形参）
     * @return {Struct.anim}
     * @context CreateAnim
    */
    static endfunction = function(f){
        self.ef = f
        return self;
    }
    /**
     * 获取计时器值
     * @return {real}
     * @context CreateAnim
    */
    static getvalue = function(){
        return value;
    }
}



/// @desc 类型检查函数
/// @param {any} obj 需要检查的对象
/// @returns {bool}
function is_anim(obj) {
    return is_struct(obj) && variable_struct_exists(obj, "type") && obj.type == "animcontroller";
}

