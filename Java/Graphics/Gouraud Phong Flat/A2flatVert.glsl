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

uniform vec4 lightPosition;
uniform int lightCount;

attribute vec4 color;
attribute vec4 vertex;
attribute vec3 normal;

varying vec3 v_P;

varying vec3 transformedNormal;

varying vec3 lightDir;
varying vec4 vertColor;
 
void main()
{
	gl_Position = transform * vertex;

	transformedNormal = normalize(normalMatrix * normal);

	v_P = gl_Position.xyz; // v_P is the world position
	vec3 vertexCamera = vec3(modelView * vertex);

	lightDir = normalize(lightPosition.xyz - vertexCamera);

	vertColor = color;
}