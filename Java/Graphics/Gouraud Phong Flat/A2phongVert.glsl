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

attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 transformedNormal;
varying vec3 lightDir;
varying vec3 vertexCamera;

void main() {
	gl_Position = transform * vertex;
	vertexCamera = vec3(modelView * vertex);
	transformedNormal = normalize(normalMatrix * normal);
	lightDir = normalize(lightPosition.xyz - vertexCamera);
	
	vertColor = color;
}