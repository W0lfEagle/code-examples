/* 
Author: Wilford Engel
Date:  12/2/2016
SRN:  130190747
Advanced Graphics and Animation Coursework Assignment One
*/
#define PROCESSING_LIGHT_SHADER

uniform int lightCount;
uniform vec4 lightPosition[8];

uniform vec4 lAmbient;
uniform vec4 lSpecular;
// uniform float ambientContribution;
uniform float shininess;

// uniform float specularExponent;

uniform mat4 modelView;
uniform mat3 normalMatrix;
uniform mat4 transform;

// attribute vec4 position;
attribute vec3 normal;
attribute vec4 vertex;
attribute vec4 color;

varying vec4 vertColor;

void main() {
	gl_Position = transform*vertex;
	vec3 vertexCamera = vec3(modelView * vertex);
	// vec3 vertexCamera = vec3(modelView * position);
	vec3 transformedNormal = normalize(normalMatrix * normal);

	float light = 0.0;
	float spec = 0.0;
	for (int i = 0; i < lightCount; i++) {
		vec3 lightDir = normalize(lightPosition[i].xyz - vertexCamera);
		light += max(0.0, dot(lightDir, transformedNormal)); //diffuse coefficient

  		if (dot(lightDir, transformedNormal) > 0.0) // = diffuseIntensity > 0.0
		{
			// SPECULAR REFLECTION from BLINN_PHONG
			vec3 halfV = normalize(lightDir + vec3(0.0, 0.0, 1.0));
			float NdotHV = max(dot(transformedNormal, halfV), 0.0);
			spec += pow(NdotHV, shininess);
  		}

	}

		// vertColor = lAmbient * ambientContribution;
		vertColor = vec4(light, light, light, 1.0) * lAmbient;
		vertColor += vec4(spec,spec,spec,1.0) * lSpecular;
}