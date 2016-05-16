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

varying vec3 v_P;

varying vec3 lightDir;
varying vec4 vertColor;
varying vec4 specular;

void main() {

	vec3 fdx = vec3(dFdx(v_P.x),dFdx(v_P.y),dFdx(v_P.z));    
    vec3 fdy = vec3(dFdy(v_P.x),dFdy(v_P.y),dFdy(v_P.z));

    vec3 N = normalize(cross(fdx,fdy));
    vec3 direction = normalize(lightDir);

    float light = max(0.0, dot(direction, N));
	
	gl_FragColor = vec4(light, light, light, 1) * vertColor;
}