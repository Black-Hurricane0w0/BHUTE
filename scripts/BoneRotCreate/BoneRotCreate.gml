/// @desc 创建一个可以旋转的骨头
/// @param {real} x 骨头的生成坐标x
/// @param {real} y 骨头的生成坐标y
/// @param {real} [move_speed]=1 骨头的移动速度
/// @param {real} [dir]=0 骨头的移动方向（0为正右）
/// @param {real} [long]=10 骨头初始长度
/// @param {real} [max_long]=10 骨头的最大长度
/// @param {real} [default_rot]=0 骨头的初始旋转角度
/// @param {real} [rotspeed]=0 骨头的旋转速度
/// @param {Constant.Color} [color]=c_white 骨头颜色（影响damage_func）
/// @param {real} [point]=0 骨头的中心点（0为底部，1为顶部）
/// @param {Asset.GMAnimCurve} [ac_bone_long]=ac_bone_default 骨头入场时所应用的长度变化曲线
/// @param {Asset.GMAnimCurve} [ac_bone_rot]=ac_bone_default 骨头入场时做应用的角度变化曲线
/// @param {real} [cost_time]=0 曲线应用时间
/// @param {real} [target_rot]=default_rot 入场结束后骨头的旋转角度
/// @param {bool} [is_mask]=true 是否收到战斗框遮罩影响
/// @param {real} [keep_time]=0 骨头的保持时间
/// @param {function} [step_func] 骨头的步执行函数（覆盖原函数）
/// @param {function} [damage_func] 骨头的伤害执行函数（覆盖原函数）
/// @param {string} [tag]="" 骨头的标签
/// @returns {id.Instance} 骨头的id
function BoneRotCreate(x,y,move_speed = 1,dir = 0,long = 10,max_long = 10,default_rot = 0,rotspeed = 0,color = c_white,point = 0,ac_bone_long = ac_bone_default,ac_bone_rot = ac_bone_default,cost_time = 0,target_rot = default_rot,is_mask = true,keep_time=0,step_func = undefined,damage_func = undefined,tag = ""){
	var inst = instance_create_depth(x,y,0,obj_bone_4){
		inst.move_speed = move_speed;
		inst.bone_default_long = long;
		inst.default_rot = default_rot;
		inst.rotspeed = rotspeed;
		inst.color = color;
		inst.movedir = dir;
		inst.offest_point = point;
		inst.ac_bone_long = ac_bone_long;
		inst.ac_bone_rot = ac_bone_rot;
		inst.cost_time = cost_time;
		inst.target_rot = target_rot;
		inst.bone_max_long = max_long;
		inst.mask = is_mask;
		inst.keep_time = keep_time;
        inst.tag = tag;
		if step_func != undefined {
			inst.step_func = step_func;
		}
        if damage_func != undefined {
            inst.damage_func = damage_func;
        }
	}
	return inst;
}
function BoneNoRotCreate(x,y,move_speed = 1,dir = 0,long = 10,max_long = 10,color = c_white,point = 0,ac_bone_long = ac_bone_default,cost_time = 0,is_mask = true,keep_time,tag = "") {
	var inst = BoneRotCreate(x,y,move_speed,dir,long,max_long,dir,0,c_white,point,ac_bone_long,,cost_time,,is_mask,keep_time){
		inst.tag = tag;
	}
}
function BoneNoAnimCreate(x,y,move_speed = 1,dir = 0,long = 10,max_long = 10,color = c_white,point = 0,is_mask = true,keep_time,tag = ""){
	var inst = BoneRotCreate(x,y,move_speed,dir,long,max_long,dir,0,c_white,point,,,0,,is_mask,keep_time){
		inst.tag = tag;
	}
}

/// @desc 创建一个自定义骨头
/// @param {Real} x
/// @param {y} y
/// @param {Constant.Color} [color]=c_white 骨头颜色（影响damage_func）
/// @param {bool} [is_mask]=true 是否收到战斗框遮罩影响
/// @param {function} [step_func] 骨头的步执行函数（覆盖原函数）
/// @param {function} [damage_func] 骨头的伤害执行函数（覆盖原函数）
/// @param {string} [tag]="" 骨头的标签
/// @returns {id.Instance} 骨头的id
function BoneCustomCreate(x,y,color = c_white,is_mask = true,step_func = undefined,damage_func = undefined,tag = ""){
	var inst = instance_create_depth(0,0,0,obj_bone_4){
		inst.x = x;
        inst.y = y;
		inst.color = color;
		inst.mask = is_mask;
        inst.tag = tag;
		if step_func != undefined {
			inst.step_func = step_func;
		}
        if damage_func != undefined {
            inst.damage_func = damage_func;
        }
	}
	return inst;
}