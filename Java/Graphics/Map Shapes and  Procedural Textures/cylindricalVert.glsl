#define M_PI 3.14159265358979323846264338327950288419716939937510;
uniform mat4 transform;

attribute vec4 vertex;
attribute vec4 position;
attribute vec3 normal;
attribute vec4 color;

varying vec4 vertColor;
varying float u, v;

void main() {
  gl_Position = transform * vertex;
    
  float p = sqrt(pow(vertex.x,2.0) + pow(vertex.y,2.0));
  // float phi = atan(vertex.y, vertex.x);
  float phi;
  if (vertex.x == 0.0 && vertex.y == 0.0) phi = 0.0;
  else if (vertex.x >= 0.0) phi = asin(vertex.y / p);
  else if (vertex.x > 0.0) phi = atan(vertex.y / vertex.x);
  else if (vertex.x < 0.0) phi = -asin(vertex.y / p) + M_PI;
  

  vertColor = color;
  u = phi;
  v = vertex.z;
}