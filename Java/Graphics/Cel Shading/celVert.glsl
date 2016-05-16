// Taken from the example at https://processing.org/tutorials/pshader ToonVert.glsl
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;
uniform mat4 modelView;

attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;
attribute vec4 position;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec3 vertexCamera;

// varying vec3 normalPass;
// varying vec3 positionPass;

void main() {
	vertexCamera = vec3(modelView * vertex);
  	gl_Position = transform * vertex;  
  	vertColor = color;
  	vertNormal = normalize(normalMatrix * normal);
  	vertLightDir = -lightNormal;

  	// normalPass = (modelView * vec4(normal, 1.0)).xyz;
  	// positionPass = position.xyz;
}