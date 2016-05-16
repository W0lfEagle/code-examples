PShape getCube(float x, float y, float z, float cubeSize, PImage tex)
{
//  Modified from http://www.openprocessing.org/sketch/
  PShape cube = createShape(); 
  cube.beginShape(QUADS);  
  float s1 = -cubeSize * 0.5;
  float s2 = +cubeSize * 0.5;
  cube.noStroke();
  cube.texture(tex);
  textureMode(NORMAL);
  
  if(!planarSet) {
    float minX = min(s1 + x, s2 + x);
    float maxX = max(s1 + x, s2 + x);
    
    float minY = min(s1 + y, s2 + y);
    float maxY = max(s1 + y, s2 + y);
    
    float rangeX = (minX - maxX) * -1;
    float rangeY = (minY - maxY) * -1;
    
    planarShader.set("rangeX", rangeX);
    A3planarShader.set("rangeX", rangeX);
    planarShader.set("rangeY", rangeY);
    A3planarShader.set("rangeY", rangeY);
    
    float offsetX = 0 - minX;
    float offsetY = 0 - minY;
    
    planarShader.set("offsetX", offsetX);
    A3planarShader.set("offsetX", offsetX);
    planarShader.set("offsetY", offsetY);
    A3planarShader.set("offsetY", offsetY);
    planarSet = true;
  }
   
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

