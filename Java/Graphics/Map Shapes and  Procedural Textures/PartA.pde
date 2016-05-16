/* 
Author: Wilford Engel
Date: 4/4/2016
*/

//Must be in folder called 'PartA' with getTorus.pde, gui.pde and shaders and run with processing 2.2.1
//PeasyCam, and g4p may need to be installed through libraries menu
import peasy.*;
import g4p_controls.*; //GUI
PeasyCam cam;
PShape torus;
PShape cube;
float angle;
float rotate;

PShader theShader;
PShader planarShader;
PShader sphericalShader;
PShader cylindricalShader;
PShader cubicShader;

PShader A3planarShader;

PImage texture;

//float[][] tex;

float avg = 0;
int count = 0;

int texWidth = 200, texHeight = 200;

float noise = 0.0;
int noiseVersion = 1;

String shape = "cube";

boolean planarSet = false;
boolean noiseOn = false;

void setup() {
  size(1000, 1000, P3D);
  frameRate(120);
  
  createGUI();
  customGUI();
  
//  cam = new PeasyCam(this, 300);
  cam = new PeasyCam(this, 0, 0, 0, 400); // Use middle click and drag to pan
  cam.setMinimumDistance(-5000);
  cam.setMaximumDistance(5000);
  
  planarShader = loadShader("planarFrag.glsl", "planarVert.glsl");
  sphericalShader = loadShader("sphericalFrag.glsl", "sphericalVert.glsl");
  cylindricalShader = loadShader("cylindricalFrag.glsl", "cylindricalVert.glsl");
//  cubicShader = loadShader("cubicFrag.glsl", "cubicVert.glsl");

  A3planarShader = loadShader("planarFrag.glsl", "A3planarVert.glsl");
  
  theShader = planarShader;
  
//  texture = loadImage("Vilca.jpg");
  

  println("Map shape = planar");
//  generateTexture();
}

void draw() {
  shader(theShader);
  rotateX(-.5);
  rotateY(-.5);//initiate rotation off center to demo 3D
  rotateY(rotate);
  background(219,238,253); // slight blue tint to give contrast to shape
  

  generateTexture();
  drawShape();

  rotate += angle;
  if (noiseOn) {
    noise = frameCount * 0.0001;
  }
  resetShader();
}



void setRotate(boolean rotate) {
  if(rotate) {
    angle = 0.02;
  }
  else angle = 0;
}

// Keyboard Controls - WARNING - may produce errors - use GUI instead
void keyPressed() {
  switch(key) {
    case '1':
      noiseVersion = 1;
      break;
    case '2':
      noiseVersion = 2;
      break;
    case '3':
      noiseVersion = 3;
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

void generateTexture() {
  // from http://www.upvector.com/?section=Tutorials&subsection=Intro%20to%20Procedural%20Textures
  // at end of functions section

  texture = createImage(texWidth, texHeight, RGB);
  for (int x = 0; x < texWidth; x++)
    for (int y = 0; y < texHeight; y++) {
      int colour = 0;
      if(noiseVersion == 1) {
        colour = int(255 * ((1 + sin( (x + noise(x * noise , y * noise )  / 2 ) * 50) ) / 2));
      }
      else if (noiseVersion == 2) {
        colour = int(255 * noise(x * noise , y * noise ));
      }
      else if (noiseVersion == 3) {
        colour = int(random(255));
      }
      color c = color(colour, colour, colour);
      texture.set(x, y, c);
    }
}

void drawShape() {
  if (shape == "cube") {
    cube = getCube(0, 0, 0, 300, texture);
    shape(cube);
  }
  else if (shape == "torus") {
    torus = getTorus(100,40,200,200, texture);
    shape(torus);
  }
}

//float planarMap(float range, float offset, float coord) {
//  
//  return 0.0;
//}



public void customGUI() {

}
