// GameMaker 片元着色器示例 (shader_frag.fsh)
varying vec2 v_vTexcoord;   // 从顶点着色器接收的纹理坐标 (0,0到1,1)
varying vec4 v_vColour;     // 从顶点着色器接收的颜色

// 从GML传入的统一变量
uniform vec3 uResolution;   // 窗口分辨率 (width, height, 0)

// 从原ShaderToy代码迁移来的函数 (这里以圆形为例)
float getCircle(vec2 p, vec2 rp){
    // 坐标转换：将纹理坐标v_vTexcoord转换到与ShaderToy的uv类似的坐标系
    // p已经是0-1范围，类似于uv，这里直接使用
    return step(distance(p, rp), 0.2);
}

void main() {
    // 计算类似于ShaderToy的uv坐标
    // v_vTexcoord本身就是(0,1)范围，但原点在左上角。调整为原点在中心，并修正宽高比。
    vec2 uv = v_vTexcoord;
    uv -= 0.5;                      // 原点移到中心 (-0.5 到 0.5)
    uv.x *= uResolution.x / uResolution.y; // 修正非正方形画布带来的拉伸
    
    // 调用迁移来的函数绘制圆形
    float circle = getCircle(uv, vec2(0.0, 0.0));
    
    // 输出颜色（白色圆形，黑色背景）
    vec4 color = vec4(circle);
    
    // 应用顶点颜色（通常用于着色器调色）并输出
    gl_FragColor = v_vColour * color;
}