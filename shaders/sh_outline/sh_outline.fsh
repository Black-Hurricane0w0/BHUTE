//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float outline_width;
uniform vec2 u_pos;
uniform vec2 u_size;

void main()
{
    //不可用
    
    vec2 uv = v_vTexcoord;
    vec2 uv_up = uv + vec2(0.0, 1.0 / u_size.y * outline_width);
    vec2 uv_down = uv + vec2(0.0, -1.0 / u_size.y * outline_width);
    vec2 uv_left = uv + vec2(-1.0 / u_size.x * outline_width, 0.0);
    vec2 uv_right = uv + vec2(1.0 / u_size.x * outline_width, 0.0);

    vec4 color_up = v_vColour * texture2D( gm_BaseTexture, uv );
    vec4 color_down = v_vColour * texture2D( gm_BaseTexture, uv_down );
    vec4 color_left = v_vColour * texture2D( gm_BaseTexture, uv_left );
    vec4 color_right = v_vColour * texture2D( gm_BaseTexture, uv_right );
    
    vec4 outline = color_up + color_down + color_left + color_right;
    gl_FragColor = outline;
    
}
