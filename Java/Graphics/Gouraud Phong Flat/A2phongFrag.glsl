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

varying vec4 vertColor;
varying vec3 transformedNormal;
varying vec3 lightDir;

void main() {
	
	vec3 direction = normalize(lightDir);
	vec3 normal = normalize(transformedNormal);
	float light = max(0.0, dot(direction, normal));
	
	gl_FragColor = vec4(light, light, light, 1) * vertColor;
}