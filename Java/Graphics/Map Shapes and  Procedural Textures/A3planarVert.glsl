uniform mat4 transform;
uniform float rangeX, rangeY, offsetX, offsetY;
attribute vec4 vertex;

attribute vec4 color;

varying vec4 vertColor;
varying float u, v;


void main() {
  gl_Position = transform * vertex;
    

  vertColor = color;

  // u = (vertex.x + offsetX) / rangeX;
  // v = (vertex.y + offsetY) / rangeY;

	u = 0.5 * ((gl_Position.x + 2 * offsetX) / rangeX);
  	v = 0.5 * ((gl_Position.y + 2 * offsetY) / rangeY);
}