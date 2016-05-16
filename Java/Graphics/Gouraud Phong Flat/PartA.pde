/* 
Author: Wilford Engel
Date:  12/2/2016
*/

//Make sure in folder called 'PartA' with getTorus.pde and shaders and run with processing 2.2.1
//PeasyCam and g4p may need to be installed through libraries menu
import peasy.*;
import g4p_controls.*; //GUI
PeasyCam cam;
PShape torus;
PShader theShader;
PShader gouraudShader;
PShader phongShader;
PShader flatShader;

void setup() {
  size(500, 500, P3D);
  
  createGUI();
  customGUI();
  
  //Part A Question 1 - enable camera navigation using the peasycam library
  cam = new PeasyCam(this, 150);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1000);
  
  // Part A Question 2 - Write and incorporate GLSL shaders - see glsl files
  gouraudShader = loadShader("A2gouraudFrag.glsl", "A2gouraudVert.glsl");
  phongShader = loadShader("A2phongFrag.glsl", "A2phongVert.glsl");
  flatShader = loadShader("A2flatFrag.glsl", "A2flatVert.glsl");
  
  theShader = gouraudShader; // Set initial shader

  torus = getTorus(50,20,100,100);
  
  println("The shader is currently the gouraud shader.");
}

void draw() {
  shader(theShader);
  background(219,238,253); // slight blue tint to give contrast to shape
  
  //Part A Question 2 - incorporate a point light that moves following the mouse position
  pointLight(255, 255, 255, mouseX-(width/2), mouseY-(height/2), 500); //white light with mouse location  
  noFill();
  stroke(255);
  pushMatrix();
  translate(mouseX-(width/2), mouseY-(height/2), 500); //Draw Sphere at light position distance set to 500 to make it visible
  sphere(20);
  popMatrix();
  
  shape(torus);

  resetShader();
}


public void customGUI() {
  
}



// Keyboard Controls - WARNING - may produce errors - use GUI instead
void keyPressed() {
  switch(key) {
    case '1': 
      theShader = gouraudShader;
      println("Gouraud Shader");
      break;
    case '2':
      theShader = phongShader;
      println("Phong Shader");
      break;
    case '3':
      theShader = flatShader;
      println("Flat Shader");
      break;
    case 'h':
      cam.pan(-10, 0);
      break;
    case 'j':
      cam.pan(10, 0);
      break;
    case 'u':
      cam.pan(0, -10);
      break;
    case 'n':
      cam.pan(0, 10);
      break;
    default:
      break;
  }
}
