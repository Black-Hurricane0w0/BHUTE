
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float f_t;

void main()
{
    vec2 uv = v_vTexcoord + vec2(f_t,0.0);
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture,uv);
}
