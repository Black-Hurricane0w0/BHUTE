
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D ScrTexture;
uniform float timer;
void main()
{
    vec4 scr_color = texture2D( ScrTexture, v_vTexcoord );
    vec4 now_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    

    gl_FragColor = vec4(scr_color.r * (1.0-timer) + now_color.r * timer,
                        scr_color.g * (1.0-timer) + now_color.g * timer,
                        scr_color.b * (1.0-timer) + now_color.b * timer,
                        1.0);
}
