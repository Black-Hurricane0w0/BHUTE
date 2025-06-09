
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 buttle_pos;
uniform vec2 arena_pos;
uniform float arena_rotation;
uniform vec2 arena_wh;
uniform bool is_rectangle;

void main()
{
    //坐标系变换
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
