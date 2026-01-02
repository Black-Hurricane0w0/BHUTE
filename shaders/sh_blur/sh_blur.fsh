// 更新后的Bloom着色器 (fsh)
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_Resolution;
uniform float u_Threshold;      // 亮度阈值
uniform float u_BlurRadius;     // 模糊半径
uniform float u_BloomIntensity; // Bloom强度

// 高斯模糊函数（保持不变）
vec3 applyGaussianBlur(sampler2D tex, vec2 uv, vec2 dir, float radius, vec2 resolution) {
    vec2 pixelSize = vec2(1.0) / resolution;
    vec2 delta = pixelSize * dir;
    
    // 优化后的高斯权重核 (9次采样)
    float weight[5];
    weight[0] = 0.227027; // 中心权重
    weight[1] = 0.1945946;
    weight[2] = 0.1216216;
    weight[3] = 0.054054;
    weight[4] = 0.016216;
    
    vec3 result = texture2D(tex, uv).rgb * weight[0];
    
    for (int i = 1; i < 5; i++) {
        float coeff = float(i);
        vec2 offset = delta * coeff * radius;
        
        result += texture2D(tex, uv + offset).rgb * weight[i];
        result += texture2D(tex, uv - offset).rgb * weight[i];
    }
    
    return result;
}

void main() {
    vec2 uv = v_vTexcoord;
    vec2 res = u_Resolution.xy;
    
    // 1. 采样原始颜色
    vec3 originalColor = texture2D(gm_BaseTexture, uv).rgb;
    
    // 2. 提取亮部 - 使用Uniform传入的阈值
    float brightness = dot(originalColor, vec3(0.2126, 0.7152, 0.0722));
    float softness = 0.1;
    float bloomMask = smoothstep(u_Threshold, u_Threshold + softness, brightness);
    vec3 highlightColor = originalColor * bloomMask;
    
    // 3. 对亮部进行高斯模糊 - 使用Uniform传入的模糊半径
    // 水平模糊Pass
    vec3 blurHorizontal = applyGaussianBlur(gm_BaseTexture, uv, vec2(1.0, 0.0), u_BlurRadius, res);
    // 垂直模糊Pass
    vec3 blurCombined = applyGaussianBlur(gm_BaseTexture, uv, vec2(0.0, 1.0), u_BlurRadius, res);
    
    // 4. 合成 - 使用Uniform传入的强度
    vec3 bloomEffect = blurCombined * u_BloomIntensity;
    
    // 可选：Bloom色调（可以也做成Uniform方便调节）
    vec3 bloomTint = vec3(1.0, 0.9, 0.8);
    bloomEffect *= bloomTint;
    
    // 最终颜色
    vec3 finalColor = originalColor + bloomEffect;
    
    // 可选：色调映射防止过曝
    finalColor = finalColor / (finalColor + vec3(1.0));
    
    gl_FragColor = v_vColour * vec4(finalColor, 1.0);
}