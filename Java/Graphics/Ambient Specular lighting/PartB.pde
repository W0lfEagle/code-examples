/* 
Author: Wilford Engel
Date:  12/2/2016
*/

//Put in folder called 'render' with getTorus.pde and run with processing 2.2.1
//PeasyCam may need to be installed through libraries menu
import peasy.*;
import g4p_controls.*; //GUI
import java.util.Random; // random placement of torus objects
PeasyCam cam;
PShape torus;
float angle;
float rotate;

PShader theShader;
PShader gouraudShader;
PShader phongShader;
PShader flatShader;

int numLights = 1;
int numTori = 1;

boolean ambient, specular;

float avg = 0;
int count = 0;

Random rand;
int[] x, y, z, d, rotation, lightX, lightY, lightZ;
int[][] lightRGB;
boolean ranAmb, ranSpec;

float shininess = 85.0;

void setup() {
  size(1000, 1000, P3D);
  
  createGUI();
  customGUI();
  
  frameRate(120);
  
  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1000);
  
  gouraudShader = loadShader("B2gouraudFrag.glsl", "B2gouraudVert.glsl");
  phongShader = loadShader("B2phongFrag.glsl", "B2phongVert.glsl");
  flatShader = loadShader("B2flatFrag.glsl", "B2flatVert.glsl");
  
  theShader = gouraudShader;

  torus = getTorus(50,20,100,100);
  
  println("Use the GUI to modify the sketch properties.");
  println("Shader = Gouraud");
  println("Torus resolution = 100");
  println("Number of lights = 1");
  println("Number of Torus objects = 1");
  
  setRandom(); // initialise torus shape coordinates
}

void draw() {
  shader(theShader);
  rotateX(-.5);
  rotateY(-.5);
  rotateY(rotate);
  background(219,238,253); // slight blue tint to give contrast to shape
  setLights();
  drawTori();
  calcFrameRate();
  resetShader();
  rotate += angle;
}

void setLights() {
  if (numLights >= 1) {
    pointLight(255, 255, 255, width/2, height/2, 500);
  }
  if (numLights > 1) {
    for (int i = 1; i < numLights; i++) {
      pointLight(150, 150, 150, lightX[i], lightY[i], lightZ[i]);
//      fill(255);
      noFill();
      stroke(255);
      pushMatrix();
      translate(lightX[i], lightY[i], lightZ[i]); //Draw Sphere at light position 
      sphere(20);
      popMatrix();
    }  
  }
  
  if (ambient) {
    theShader.set("lAmbient", 0.5, 0.2, 0.2, 1.0);
  }
  else if (!ambient) {
    theShader.set("lAmbient", 0.3, 0.3, 0.3, 1.0); // set base torus colour
  }
  
  if (specular) {
      theShader.set("lSpecular", 0.0, 0.5, 0.0, 1.0);
  }
  else if (!specular) {
    theShader.set("lSpecular", 0.0, 0.0, 0.0, 1.0);
  }
  theShader.set("shininess", shininess);
}

void drawTori() {
  if (numTori >= 1) {
    shape(torus);
  }
  if (numTori > 1) {
    for (int i = 0; i < numTori; i++) {
      pushMatrix();
      translate(0, 0, z[i]);
      rotateX(rotation[i]);
      rotateY(rotation[i]);
      rotateZ(rotation[i]);
      shape(torus, x[i], y[i], d[i], d[i]);
      popMatrix();
    }
  }
}

void setRandom() {
  rand = new Random();
  x = new int[100]; // x position of torus
  y = new int[100]; // y position of torus
  z = new int[100]; // z position of torus
  d = new int[100]; // torus dimensions
  rotation = new int[100];
  for (int i = 0; i < 100; i++) {
    x[i] = rand.nextInt(2000) - 1000; // x pos
    y[i] = rand.nextInt(2000)- 1000; // y pos
    z[i] = rand.nextInt(2000) - 1000; // z pos
    d[i] = rand.nextInt((500 - 10) + 10) + 10; // dimensions
    rotation[i] = rand.nextInt((360 - 10) + 10) + 10;
  }
  
  lightX = new int[8];
  lightY = new int[8];
  lightZ = new int[8];
  for (int i = 0; i < 8; i++) {
    lightX[i] = rand.nextInt(width*2) - width;
    lightY[i] = rand.nextInt(height*2) - height;
    lightZ[i] = rand.nextInt(2000) - 1000;
  }
  
  lightRGB = new int[2][3];
  for (int i = 0; i < 2; i++) {
    lightRGB[i][0] = rand.nextInt(255);
    lightRGB[i][1] = rand.nextInt(255);
    lightRGB[i][2] = rand.nextInt(255);
  }
}

void setTorusRes(int resolution) {
  torus = getTorus(50, 20, resolution, resolution);
}

void calcFrameRate() {
  avg += frameRate;
  count++;
  if (count == 50) {
    String value = String.format("%.2f", avg/50);
    framerate.setText(value);
    avg = 0;
    count = 0;
  }
}

void setRotate(boolean rotate) {
  if(rotate) {
    angle = 0.02;
  }
  else angle = 0;
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
    case 'q':
      torus = getTorus(50,20,10,10);
      println("resolution set to 10");
      break;
    case 'w':
      torus = getTorus(50,20,25,25);
      println("resolution set to 25");
      break;
    case 'e':
      torus = getTorus(50,20,50,50);
      println("resolution set to 50");
      break;
    case 'r':
      torus = getTorus(50,20,100,100);
      println("resolution set to 100");
      break;
    case 't':
      torus = getTorus(50,20,1000,1000);
      println("resolution set to 1000");
      break;
    case 'a':
      numLights = 1;
      println("1 light on");
      break;
    case 's':
      numLights = 2;
      println("2 lights on");
      break;
    case 'd':
      numLights = 3;
      println("3 lights on");
      break;
    case 'f':
      numLights = 4;
      println("4 lights on");
      break;
    case 'z':
      numTori = 0;
      println("0 tori");
      break;
    case 'x':
      numTori = 1;
      println("1 torus");
      break;
    case 'c':
      numTori = 2;
      println("2 tori");
      break;
    case 'v':
      numTori = 3;
      println("3 tori");
      break;
    case 'b':
      numTori = 4;
      println("4 tori");
      break;
    case 'o':
      ambient = true;
      println("Ambient light on");
      break;
    case 'p':
      ambient = false;
      println("Ambient light off");
      break;
    case 'k':
      specular = true;
      println("Specular light on");
      break;
    case 'l':
      specular = false;
      println("Specular light off");
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
