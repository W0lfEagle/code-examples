#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying float u,v;

void main() {
  	gl_FragColor = texture2D(texture, vec2(u, v)) * vertColor;
}