/* 
Author: Wilford Engel
Date:  12/2/2016
SRN:  130190747
Advanced Graphics and Animation Coursework Assignment One
*/
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

// uniform vec3 lightAmbient[8];
uniform vec3 ambient;

varying vec4 vertColor;

void main() {
  gl_FragColor = vertColor;
}