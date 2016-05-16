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

uniform int lightCount;
uniform vec4 lAmbient;
uniform vec4 lSpecular;
uniform float shininess;

varying vec4 vertColor;
varying vec3 transformedNormal;
varying vec3 lightDir[8];

void main() {
	float light = 0.0;
	float spec = 0.0;
	for (int i = 0; i < lightCount; i++) {
		vec3 direction = normalize(lightDir[i]);
		vec3 normal = normalize(transformedNormal);
		light += max(0.0, dot(direction, normal));

		// SPECULAR REFLECTION
  		if (dot(direction, transformedNormal) > 0.0) // = diffuseIntensity > 0.0
		{
			// SPECULAR REFLECTION from BLINN_PHONG
			vec3 halfV = normalize(lightDir[i] + vec3(0.0, 0.0, 1.0));
			float NdotHV = max(dot(transformedNormal, halfV), 0.0);
			spec += pow(NdotHV, shininess);
  		}
	}

	vec4 specular = vec4(spec * lSpecular);

	gl_FragColor = vec4(light, light, light, 1.0) * lAmbient + specular;
}