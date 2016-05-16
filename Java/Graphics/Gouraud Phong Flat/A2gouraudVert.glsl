/* 
Author: Wilford Engel
Date:  12/2/2016
SRN:  130190747
Advanced Graphics and Animation Coursework Assignment One
*/
#define PROCESSING_LIGHT_SHADER

uniform vec4 lightPosition;

uniform mat4 modelView;
uniform mat3 normalMatrix;
uniform mat4 transform;

attribute vec3 normal;
attribute vec4 vertex;
attribute vec4 color;

varying vec4 vertColor;

void main() {
	gl_Position = transform*vertex;
	vec3 vertexCamera = vec3(modelView * vertex);
	vec3 transformedNormal = normalize(normalMatrix * normal);

	vec3 lightDir = normalize(lightPosition.xyz - vertexCamera);
	float light = max(0.0, dot(lightDir, transformedNormal)); //diffuse coefficient

	vertColor = vec4(light, light, light, 1) * color;
}

