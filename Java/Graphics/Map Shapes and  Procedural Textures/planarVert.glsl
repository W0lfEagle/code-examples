uniform mat4 transform;
uniform float rangeX, rangeY, offsetX, offsetY;
attribute vec4 vertex;

attribute vec4 color;

varying vec4 vertColor;
varying float u, v;


void main() {
  gl_Position = transform * vertex;
    

  vertColor = color;

  u = (vertex.x + offsetX) / rangeX;
  v = (vertex.y + offsetY) / rangeY;
}