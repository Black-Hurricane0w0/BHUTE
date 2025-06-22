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
    _anim = animcurve_get_channel(animcurve_get(AllAnim),"default")
    static type = "animcontroller";
    /**
     * @param {real} maxtime
     * @param {real} a
     * @param {real} b
     * @return {struct.anim}
    */
    static add = function(maxtime,a,b){
        self.maxtime = maxtime;
        self.a = a;
        self.b = b;
        return self;
    }
    /**
     * @return {struct.anim}
    */
    static run = function(){
        time++;
        value = animcurve_channel_evaluate(_anim,time/maxtime);
        f(value);
        return self;
    }
    /**
     * 执行一个函数,参数为real
     * @param {Function} f
     * @return {struct.anim}
    */
    static execute = function(f){
        self.f = f;
        return self;
    }
    /**
     * @param {string} animname
     * @return {struct.anim}
    */
    static anim = function(animname){
        if animcurve_get_channel_index(animcurve_get(AllAnim),animname) >= 0{
            _anim = animcurve_get_channel(animcurve_get(AllAnim),animname);
        }else {
            _anim = animcurve_get_channel(animcurve_get(AllAnim),"default");
        }
        return self;
    }
}



/// @desc 类型检查函数
/// @param {any} obj 需要检查的对象
/// @returns {bool}
function is_anim(obj) {
    return is_struct(obj) && variable_struct_exists(obj, "type") && obj.type == "animcontroller";
}
