/* 
Author: Wilford Engel
Date: 4/4/2016
*/

//Must be in folder called 'PartB' with gui.pde and shaders and run with processing 2.2.1
//g4p may need to be installed through libraries menu
import g4p_controls.*; //GUI
import peasy.*;
PeasyCam cam;
PShader theShader;
PShape cube;
             
PImage one, two, three, four, five, image;

void setup() { 
  size(640, 360, P3D);
  createGUI();
  customGUI();
  cam = new PeasyCam(this, 0, 0, 0, 300); // Use middle click and drag to pan
  cam.setMinimumDistance(-5000);
  cam.setMaximumDistance(5000);
  one = loadImage("one.jpg");
  two = loadImage("two.jpg");
  three = loadImage("three.jpg");
  four = loadImage("four.jpg");
  five = loadImage("five.jpg");
  image = three; // image set by GUI
  
  theShader = loadShader("edge.glsl");
}

void draw() {
  shader(theShader);
  rotateX(-.5);
  rotateY(-.5);
  background(image);
  drawCube(image);
  resetShader();
}

// Modified from the example at https://processing.org/examples/texturecube.html 
void drawCube(PImage tex) {
  beginShape(QUADS);
  textureMode(NORMAL);
  texture(tex);

  
  // +Z "front" face
  vertex(-100, -100, 100, 0, 0);
  vertex( 100, -100,  100, 1, 0);
  vertex( 100,  100,  100, 1, 1);
  vertex(-100,  100,  100, 0, 1);

  // -Z "back" face
  vertex( 100, -100, -100, 0, 0);
  vertex(-100, -100, -100, 1, 0);
  vertex(-100,  100, -100, 1, 1);
  vertex( 100,  100, -100, 0, 1);

  // +Y "bottom" face
  vertex(-100,  100,  100, 0, 0);
  vertex( 100,  100,  100, 1, 0);
  vertex( 100,  100, -100, 1, 1);
  vertex(-100,  100, -100, 0, 1);

  // -Y "top" face
  vertex(-100, -100, -100, 0, 0);
  vertex( 100, -100, -100, 1, 0);
  vertex( 100, -100,  100, 1, 1);
  vertex(-100, -100,  100, 0, 1);

  // +X "right" face
  vertex( 100, -100,  100, 0, 0);
  vertex( 100, -100, -100, 1, 0);
  vertex( 100,  100, -100, 1, 1);
  vertex( 100,  100,  100, 0, 1);

  // -X "left" face
  vertex(-100, -100, -100, 0, 0);
  vertex(-100, -100,  100, 1, 0);
  vertex(-100,  100,  100, 1, 1);
  vertex(-100,  100, -100, 0, 1);

  endShape();
}


public void customGUI() {

}
