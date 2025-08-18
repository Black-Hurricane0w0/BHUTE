
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D ScrTexture;
uniform float timer;
void main()
{
    vec4 scr_color = texture2D( ScrTexture, v_vTexcoord );
    vec4 now_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    

    gl_FragColor = vec4(mix(scr_color.rgb,now_color.rgb,clamp(timer,0.0,1.0)),1.0);
}
