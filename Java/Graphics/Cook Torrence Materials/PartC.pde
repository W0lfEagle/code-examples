/* 
Author: Wilford Engel
Date:  12/2/2016
*/

//Must be in folder called 'PartC' with getTorus.pde, GUI.pde and shaders and run with processing 2.2.1
//PeasyCam, and g4p may need to be installed through libraries menu
import peasy.*;
import g4p_controls.*; //GUI
import java.util.Random; // random placement of torus objects
PeasyCam cam;
PShape torus;
float angle;
float rotate;

PShader theShader;
PShader cookTorrShader;
PShader testShader;

int numLights = 1;
int numTori = 1;

String material = "emerald";

float avg = 0;
int count = 0;

Random rand;
int[] x, y, z, d, rotation, lightX, lightY, lightZ;

//Custom Material Variables
float[] amb, dif, spec;
float shininess;

float lightPower = 7000;

void setup() {
  size(1000, 1000, P3D);
  frameRate(120);
  
  createGUI();
  customGUI();
  
//  cam = new PeasyCam(this, 300);
  cam = new PeasyCam(this, 0, 0, 0, 300); // Use middle click and drag to pan
  cam.setMinimumDistance(-5000);
  cam.setMaximumDistance(5000);
  
  cookTorrShader = loadShader("cookTorrFrag.glsl", "cookTorrVert.glsl");
//  testShader = loadShader("testFrag.glsl", "testVert.glsl");
  
  theShader = cookTorrShader;
//  theShader = testShader;
  
  theShader.set("lightPower", lightPower, lightPower, lightPower);
  
  torus = getTorus(50,20,100,100);
  println("Shader = Cook Torrance");
  println("\nResolution (vertex count) = 100.");
  println("\nLight count = 1.");
  println("\nTorus count = 1.");
  println("\nMaterial = emerald");  
  
  amb = new float[3];
  dif = new float[3];
  spec = new float[3];
  
  setRandom();
}

void draw() {
  shader(theShader);
  rotateX(-.5);
  rotateY(-.5);//initiate rotation off center to demo 3D
  rotateY(rotate);
  background(219,238,253); // slight blue tint to give contrast to shape
  setLights();
  setMaterial();
  drawTori();
  calcFrameRate();
  resetShader();
  rotate += angle;
}

void setLights() {
  if (numLights >= 1) {
    pointLight(255, 255, 255, width/2, height/2, 1000);
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
  theShader.set("lightPower", lightPower, lightPower, lightPower);
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

void setMaterial() {
  if (material == "emerald") {
    theShader.set("ambient", 0.0215, 0.1745, 0.0215);
    //  theShader.set("ambient", 0.5, 0.5, 0.5);
    theShader.set("Kd", 0.07568, 0.61424, 0.07568);
    theShader.set("Ks", 0.633, 0.727811, 0.633);
//    theShader.set("m", 0.4);
    theShader.set("s", 0.6);
  }
  else if (material == "brass") {
    theShader.set("ambient", 0.329412, 0.223529, 0.027451);
    //  theShader.set("ambient", 0.5, 0.5, 0.5);
    theShader.set("Kd", 0.780392, 0.568627, 0.113725);
    theShader.set("Ks", 0.992157, 0.941176, 0.807843);
//    theShader.set("m", 0.78205128);
    theShader.set("s", 0.21794872);
  }
  else if (material == "chrome") {
    theShader.set("ambient", 0.25, 0.25, 0.25);
    theShader.set("Kd", 0.4, 0.4, 0.4);
    theShader.set("Ks", 0.774597, 0.774597, 0.774597);
//    shininess = 0.6 * 128;
//    theShader.set("m", 0.4);
    theShader.set("s", 0.6);
  }
  else if (material == "plastic") {
    theShader.set("ambient", 0.0, 0.0, 0.0);
    theShader.set("Kd", 0.5, 0.0, 0.0);
    theShader.set("Ks", 0.7, 0.6, 0.6);
//    shininess = 0.4 * 128;
//    theShader.set("m", 0.75);
    theShader.set("s", 0.25);
  }
  else if (material == "pearl") {
    theShader.set("ambient", 0.25, 0.20725, 0.20725);
    theShader.set("Kd", 1.0, 0.829, 0.829);
    theShader.set("Ks", 0.296648, 0.296648, 0.296648);
//    theShader.set("m", 0.921875);
    theShader.set("s", 0.088);
  }
  else if (material == "custom") {
    theShader.set("ambient", amb[0], amb[1], amb[2]);
    theShader.set("Kd", dif[0], dif[1], dif[2]);
    theShader.set("Ks", spec[0], spec[1], spec[2]);
    theShader.set("s", shininess);
//    println("Material Set");
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
    case '5':
      material = "emerald";
      println("Emerald");
      break;
    case '6':
      material = "brass";
      println("Brass");
      break;
    case '7':
      material = "chrome";
      println("Chrome");
      break;
    case '8':
      material = "plastic";
      println("Red plastic");
      break;
    case '9':
      material = "pearl";
      println("Pearl");
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


