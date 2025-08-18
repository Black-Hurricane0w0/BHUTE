//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float timer;
void main()
{
    
    vec4 white = v_vColour * vec4(1.0, 1.0, 1.0, 1.0);
    vec4 now_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

    gl_FragColor = vec4(mix(white.rbg,now_color.rbg,clamp(timer,0.0,1.0)),texture2D( gm_BaseTexture, v_vTexcoord ).a);
}
