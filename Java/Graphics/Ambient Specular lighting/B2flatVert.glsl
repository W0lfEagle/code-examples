/* 
Author: Wilford Engel
Date:  12/2/2016
SRN:  130190747
Advanced Graphics and Animation Coursework Assignment One
*/
#define PROCESSING_LIGHT_SHADER
uniform mat4 modelView;
uniform mat4 transform;
uniform mat3 normalMatrix;

uniform vec4 lightPosition[8];
uniform int lightCount;
uniform vec4 lAmbient;
uniform vec4 lSpecular;
uniform float shininess;

attribute vec4 vertex;
attribute vec3 normal;

varying vec3 v_P;

varying vec3 transformedNormal;

varying vec3 lightDir[8];
varying vec4 vertColor;
 
void main()
{
	gl_Position = transform * vertex;

	transformedNormal = normalize(normalMatrix * normal);

	v_P = gl_Position.xyz; // v_P is the world position
	vec3 vertexCamera = vec3(modelView * vertex);

	for (int i = 0; i < lightCount; i++) {
		lightDir[i] = normalize(lightPosition[i].xyz - vertexCamera);
	}

	vertColor = lAmbient;
}