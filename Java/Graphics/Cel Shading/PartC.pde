/* 
Author: Wilford Engel
Date: 4/4/2016
*/

//Must be in folder called 'PartC' with gui.pde and shaders and run with processing 2.2.1
//g4p may need to be installed through libraries menu
import g4p_controls.*; //GUI
import peasy.*;
PeasyCam cam;
PShader theShader;
PShape cube;
PShape torus;
PShape bunny;
PShape f16;

String shape = "torus";

float fraction = 1.0;

float[][][] colors = {{{0.1,0.8,0.4},{0.9,0.1,0.3},{0.2,0.2,0.9}},
                     {{1.0,0.4,0.2},{0.5,0.7,0.3},{0.2,0.2,0.3}},
                     {{0.1,0.9,0.9},{0.9,0.9,0.9},{0.1,0.1,0.1}}};
int currentColor = 1;

void setup() { 
  size(1000, 1000, P3D);
  createGUI();
  customGUI();
  cam = new PeasyCam(this, 0, 0, 0, 500); // Use middle click and drag to pan
  cam.setMinimumDistance(-5000);
  cam.setMaximumDistance(5000);
  torus = getTorus(100,40,200,200);
  cube = getCube(0,0,0,100);
  bunny = loadShape("bunny.obj");
  bunny.scale(100);
  f16 = loadShape("f16.obj");
  f16.scale(100);
  
  
  theShader = loadShader("celFrag.glsl", "celVert.glsl");
  theShader.set("fraction", fraction);
}

void draw() {
  shader(theShader);
  rotateX(-.5);
  rotateY(-.5);
  background(219,238,253);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(255, 255, 255, dirY, dirX, -1);
//  pointLight(255,255,255,100,100,100);
//  lights();
//  pointLight(51, 102, 126, 35, 40, 36);
  setStuff();
  drawShape();
  resetShader();
}

void setStuff() {
  theShader.set("fraction", fraction);
  if (currentColor == 1) {
    theShader.set("colors1", colors[0][0][0], colors[0][0][1], colors[0][0][2]);
    theShader.set("colors2", colors[0][1][0], colors[0][1][1], colors[0][1][2]);
    theShader.set("colors3", colors[0][2][0], colors[0][2][1], colors[0][2][2]);
  }
  else if (currentColor == 2) {
    theShader.set("colors1", colors[1][0][0], colors[1][0][1], colors[1][0][2]);
    theShader.set("colors2", colors[1][1][0], colors[1][1][1], colors[1][1][2]);
    theShader.set("colors3", colors[1][2][0], colors[1][2][1], colors[1][2][2]);
  }
  else if (currentColor == 3) {
    theShader.set("colors1", colors[2][0][0], colors[2][0][1], colors[2][0][2]);
    theShader.set("colors2", colors[2][1][0], colors[2][1][1], colors[2][1][2]);
    theShader.set("colors3", colors[2][2][0], colors[2][2][1], colors[2][2][2]);
  }
}

void drawShape() {
  if (shape == "cube") {
//    cube = getCube(0, 0, 0, 200, texture);
    shape(cube);
  }
  else if (shape == "torus") {
//    torus = getTorus(100,40,200,200, texture);
    
    shape(torus);
  }
  else if (shape == "bunny") {
    shape(bunny);
  }
  else if (shape == "f16") {
    shape(f16);
  }
}


public void customGUI() {

}
