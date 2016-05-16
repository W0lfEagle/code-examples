/* 
Author: Wilford Engel
Date:  12/2/2016
SRN:  130190747
Advanced Graphics and Animation Coursework Assignment One
*/
/* Normals calculations from Bitbucket.org, (2013). volumesoffun / PolyVox / wiki / Computing normals in a fragment shader — Bitbucket . [online] Available at: https://bitbucket.org/volumesoffun/polyvox/wiki/Computing%20normals%20in%20a%20fragment%20shader [Accessed 11 Feb. 2016]. */

#version 120

uniform int lightCount;
uniform vec4 lAmbient;
uniform vec4 lSpecular;
uniform float shininess;

varying vec3 v_P;

varying vec3 lightDir[8];
varying vec4 vertColor;
varying vec4 specular;

void main() {
    float light = 0.0;
    float spec = 0.0;

    for (int i = 0; i < lightCount; i++) {
		vec3 fdx = vec3(dFdx(v_P.x),dFdx(v_P.y),dFdx(v_P.z));    
	    vec3 fdy = vec3(dFdy(v_P.x),dFdy(v_P.y),dFdy(v_P.z));

	    vec3 N = normalize(cross(fdx,fdy));
	    vec3 direction = normalize(lightDir[i]);

	    light += max(0.0, dot(direction, N)); 
	    // SPECULAR REFLECTION
  		if (dot(lightDir[i], N) > 0.0) // = diffuseIntensity > 0.0
		{
			// SPECULAR REFLECTION from BLINN_PHONG
			vec3 halfV = normalize(lightDir[i] + vec3(0.0, 0.0, 1.0));
			float NdotHV = max(dot(N, halfV), 0.0);
			spec += pow(NdotHV, shininess);
  		}  
	}
	vec4 specular = vec4(spec * lSpecular);

	gl_FragColor = vec4(light, light, light, 1.0) * lAmbient + specular;
}