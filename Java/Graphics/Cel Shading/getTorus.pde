// Example of use:     torus = getTorus(200,100,32,32);
PShape getTorus(float outerRad, float innerRad, int numc, int numt) { // , PImage tex
  
//  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(TRIANGLE_STRIP);
  sh.noStroke();
//  sh.texture(tex);

  float x, y, z, s, t, u, v;
  float nx, ny, nz;
  float a1, a2;
  int idx = 0;
  for (int i = 0; i < numc; i++) {
    for (int j = 0; j <= numt; j++) {
      for (int k = 1; k >= 0; k--) {
         s = (i + k) % numc + 0.5;
         t = j % numt;
         u = s / numc;
         v = t / numt;
         a1 = s * TWO_PI / numc;
         a2 = t * TWO_PI / numt;
 
         x = (outerRad + innerRad * cos(a1)) * cos(a2);
         y = (outerRad + innerRad * cos(a1)) * sin(a2);
         z = innerRad * sin(a1);
 
         nx = cos(a1) * cos(a2); 
         ny = cos(a1) * sin(a2);
         nz = sin(a1);
         sh.normal(nx, ny, nz);
         sh.vertex(x, y, z, u, v);
         
      }
    }
  }
   sh.endShape(); 
  return sh;
}
