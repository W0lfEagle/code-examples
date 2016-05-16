PShape getCube(float x, float y, float z, float cubeSize) //, PImage tex
{
  
  PShape cube = createShape();   // >= v2.0 only!!!
  cube.beginShape(QUADS);   // >= v2.0 only!!!
  float s1 = -cubeSize * 0.5;
  float s2 = +cubeSize * 0.5;
  cube.noStroke();
//  cube.texture(tex);
//  textureMode(NORMAL);
   
  // Front face
  cube.fill(255);
  cube.normal(0, 0, 1);
   cube.vertex(s1 + x, s1 + y, s1 + z);
   cube.vertex(s2 + x, s1 + y, s1 + z);
   cube.vertex(s2 + x, s2 + y, s1 + z);
   cube.vertex(s1 + x, s2 + y, s1 + z);
  
  // Back face
  cube.normal(0, 0, -1);
   cube.vertex(s1 + x, s1 + y, s2 + z);
   cube.vertex(s2 + x, s1 + y, s2 + z);
   cube.vertex(s2 + x, s2 + y, s2 + z);
   cube.vertex(s1 + x, s2 + y, s2 + z);
  
  // Left face
  cube.normal(1, 0, 0);
   cube.vertex(s1 + x, s1 + y, s1 + z);
   cube.vertex(s1 + x, s1 + y, s2 + z);
   cube.vertex(s1 + x, s2 + y, s2 + z);
   cube.vertex(s1 + x, s2 + y, s1 + z);
  
  // Right face
  cube.normal(-1, 0, 0);
   cube.vertex(s2 + x, s1 + y, s1 + z);
   cube.vertex(s2 + x, s1 + y, s2 + z);
   cube.vertex(s2 + x, s2 + y, s2 + z);
   cube.vertex(s2 + x, s2 + y, s1 + z);
  
  // Top face
  cube.normal(0, 1, 0);
   cube.vertex(s1 + x, s1 + y, s1 + z);
   cube.vertex(s2 + x, s1 + y, s1 + z);
   cube.vertex(s2 + x, s1 + y, s2 + z);
   cube.vertex(s1 + x, s1 + y, s2 + z);
  
  // Bottom face
  cube.normal(0, -1, 0);
   cube.vertex(s1 + x, s2 + y, s1 + z);
   cube.vertex(s2 + x, s2 + y, s1 + z);
   cube.vertex(s2 + x, s2 + y, s2 + z);
   cube.vertex(s1 + x, s2 + y, s2 + z);
 
  //cube.end();
  cube.endShape();
  return cube;
}

