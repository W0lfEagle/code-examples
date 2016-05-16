uniform mat4 transform;

// uniform mat4 texMatrix;

attribute vec4 vertex;
attribute vec4 color;

varying vec4 vertColor;
varying float u, v;

void main() {
  gl_Position = transform * vertex;
  
  // https://en.wikipedia.org/wiki/Spherical_coordinate_system
  float r = sqrt(pow(vertex.x, 2.0) + pow(vertex.y, 2.0) + pow(vertex.z, 2.0));
  float theta = acos(vertex.z / r);
  float phi = atan(vertex.y / vertex.x);

  vertColor = color;

  u = theta;
  v = phi;
}