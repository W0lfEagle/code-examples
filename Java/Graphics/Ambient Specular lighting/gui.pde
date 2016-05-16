/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(GWinApplet appc, GWinData data) { //_CODE_:window1:730828:
  appc.background(230);
} //_CODE_:window1:730828:

public void option1_clicked1(GOption source, GEvent event) { //_CODE_:option1:687909:
  println("Shader = Gouraud");
  theShader = gouraudShader;
} //_CODE_:option1:687909:

public void option2_clicked1(GOption source, GEvent event) { //_CODE_:option2:481339:
  println("Shader = Phong");
  theShader = phongShader;
} //_CODE_:option2:481339:

public void option3_clicked1(GOption source, GEvent event) { //_CODE_:option3:657238:
  println("Shader = Flat");
  theShader = flatShader;
} //_CODE_:option3:657238:

public void torus_res_slider_change1(GCustomSlider source, GEvent event) { //_CODE_:torus_res_slider:800360:
//  println("custom_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
  if (event == GEvent.VALUE_STEADY) {
    setTorusRes(source.getValueI());
  }
} //_CODE_:torus_res_slider:800360:

public void lights_slider_change1(GSlider source, GEvent event) { //_CODE_:lights_slider:621888:
//  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
  if (event == GEvent.VALUE_STEADY) {
    numLights = source.getValueI();
  }
} //_CODE_:lights_slider:621888:

public void torus_object_slider_change1(GCustomSlider source, GEvent event) { //_CODE_:torus_object_slider:778204:
//  println("custom_slider2 - GCustomSlider >> GEvent." + event + " @ " + millis());
//  println("There are now " + source.getValueI() + " torus objects in the scene");
  numTori = source.getValueI();
} //_CODE_:torus_object_slider:778204:

public void ambientlight_clicked1(GCheckbox source, GEvent event) { //_CODE_:ambientlight:880449:
//  println("ambientlight - GCheckbox >> GEvent." + event + " @ " + millis());
  if (source.isSelected() == true) {
    println("Ambient light on");
    ambient = true;
  }
  else if(source.isSelected() == false) {
    println("Ambient light off");
    ambient = false;
  }
} //_CODE_:ambientlight:880449:

public void checkbox1_clicked1(GCheckbox source, GEvent event) { //_CODE_:specularlight:490309:
//  println("specularlight - GCheckbox >> GEvent." + event + " @ " + millis());
  if (source.isSelected() == true) {
    println("Specular light on");
    specular = true;
  }
  else if(source.isSelected() == false) {
    println("Specular light off");
    specular = false;
  }
} //_CODE_:specularlight:490309:

public void exponent_change1(GSlider source, GEvent event) { //_CODE_:exponent:260091:
//  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
//  theShader.set("specularExponent", source.getValueF());
//  println(source.getValueF());
//  setExponent(1.0);
  shininess = source.getValueF();
//  theShader.set("specularExponent", 10.0);
} //_CODE_:exponent:260091:

public void randomButton_click1(GButton source, GEvent event) { //_CODE_:randomButton:931258:
//  println("randomButton - GButton >> GEvent." + event + " @ " + millis());
  setRandom();
} //_CODE_:randomButton:931258:

public void rotateOn_clicked1(GCheckbox source, GEvent event) { //_CODE_:rotateOn:401299:
//  println("rotateOn - GCheckbox >> GEvent." + event + " @ " + millis());
//  setRotate(true);
  if (source.isSelected() == true) {
    setRotate(true);
  }
  else if(source.isSelected() == false) {
    setRotate(false);
  }
} //_CODE_:rotateOn:401299:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  window1 = new GWindow(this, "Control Window", 0, 0, 540, 500, false, JAVA2D);
  window1.addDrawHandler(this, "win_draw1");
  label1 = new GLabel(window1.papplet, 12, 10, 80, 20);
  label1.setText("Shader");
  label1.setOpaque(false);
  togGroup1 = new GToggleGroup();
  option1 = new GOption(window1.papplet, 110, 10, 120, 20);
  option1.setText("Gouraud");
  option1.setOpaque(false);
  option1.addEventHandler(this, "option1_clicked1");
  option2 = new GOption(window1.papplet, 240, 10, 120, 20);
  option2.setText("Phong");
  option2.setOpaque(false);
  option2.addEventHandler(this, "option2_clicked1");
  option3 = new GOption(window1.papplet, 370, 10, 120, 20);
  option3.setText("Flat");
  option3.setOpaque(false);
  option3.addEventHandler(this, "option3_clicked1");
  togGroup1.addControl(option1);
  option1.setSelected(true);
  togGroup1.addControl(option2);
  togGroup1.addControl(option3);
  label2 = new GLabel(window1.papplet, 12, 50, 80, 60);
  label2.setText("Torus Resolution");
  label2.setOpaque(false);
  torus_res_slider = new GCustomSlider(window1.papplet, 110, 50, 310, 60, "grey_blue");
  torus_res_slider.setShowValue(true);
  torus_res_slider.setShowLimits(true);
  torus_res_slider.setLimits(100, 10, 500);
  torus_res_slider.setNbrTicks(500);
  torus_res_slider.setNumberFormat(G4P.INTEGER, 0);
  torus_res_slider.setOpaque(false);
  torus_res_slider.addEventHandler(this, "torus_res_slider_change1");
  label3 = new GLabel(window1.papplet, 12, 130, 80, 60);
  label3.setText("Lights");
  label3.setOpaque(false);
  lights_slider = new GSlider(window1.papplet, 110, 130, 310, 60, 10.0);
  lights_slider.setShowValue(true);
  lights_slider.setShowLimits(true);
  lights_slider.setLimits(1, 1, 8);
  lights_slider.setNbrTicks(8);
  lights_slider.setStickToTicks(true);
  lights_slider.setShowTicks(true);
  lights_slider.setNumberFormat(G4P.INTEGER, 0);
  lights_slider.setOpaque(false);
  lights_slider.addEventHandler(this, "lights_slider_change1");
  label4 = new GLabel(window1.papplet, 12, 210, 80, 60);
  label4.setText("Torus Objects");
  label4.setOpaque(false);
  torus_object_slider = new GCustomSlider(window1.papplet, 110, 210, 310, 60, "DECIMAL");
  torus_object_slider.setShowValue(true);
  torus_object_slider.setShowLimits(true);
  torus_object_slider.setLimits(1, 1, 100);
  torus_object_slider.setNbrTicks(100);
  torus_object_slider.setNumberFormat(G4P.INTEGER, 0);
  torus_object_slider.setOpaque(false);
  torus_object_slider.addEventHandler(this, "torus_object_slider_change1");
  framerate = new GLabel(window1.papplet, 110, 460, 80, 20);
  framerate.setText("calculating...");
  framerate.setOpaque(false);
  label5 = new GLabel(window1.papplet, 12, 460, 80, 20);
  label5.setText("Frame Rate");
  label5.setOpaque(false);
  label6 = new GLabel(window1.papplet, 12, 290, 80, 20);
  label6.setText("Ambient Light");
  label6.setOpaque(false);
  ambientlight = new GCheckbox(window1.papplet, 110, 290, 120, 20);
  ambientlight.setOpaque(false);
  ambientlight.addEventHandler(this, "ambientlight_clicked1");
  label7 = new GLabel(window1.papplet, 12, 325, 80, 30);
  label7.setText("Specular Light");
  label7.setOpaque(false);
  specularlight = new GCheckbox(window1.papplet, 110, 330, 120, 20);
  specularlight.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  specularlight.setOpaque(false);
  specularlight.addEventHandler(this, "checkbox1_clicked1");
  exponent = new GSlider(window1.papplet, 234, 311, 100, 60, 10.0);
  exponent.setShowValue(true);
  exponent.setShowLimits(true);
  exponent.setLimits(85.0, 1.0, 100.0);
  exponent.setNbrTicks(50);
  exponent.setNumberFormat(G4P.DECIMAL, 2);
  exponent.setOpaque(false);
  exponent.addEventHandler(this, "exponent_change1");
  label8 = new GLabel(window1.papplet, 137, 330, 80, 20);
  label8.setText("Exponent");
  label8.setOpaque(false);
  label9 = new GLabel(window1.papplet, 12, 380, 80, 30);
  label9.setText("Randomize positions");
  label9.setOpaque(false);
  randomButton = new GButton(window1.papplet, 110, 380, 80, 30);
  randomButton.setText("Random");
  randomButton.setTextBold();
  randomButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  randomButton.addEventHandler(this, "randomButton_click1");
  label10 = new GLabel(window1.papplet, 12, 425, 80, 20);
  label10.setText("Rotate");
  label10.setOpaque(false);
  rotateOn = new GCheckbox(window1.papplet, 110, 427, 120, 20);
  rotateOn.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  rotateOn.setOpaque(false);
  rotateOn.addEventHandler(this, "rotateOn_clicked1");
  label11 = new GLabel(window1.papplet, 430, 51, 80, 56);
  label11.setText("Warning! If Tori vanish, restart.");
  label11.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GLabel label1; 
GToggleGroup togGroup1; 
GOption option1; 
GOption option2; 
GOption option3; 
GLabel label2; 
GCustomSlider torus_res_slider; 
GLabel label3; 
GSlider lights_slider; 
GLabel label4; 
GCustomSlider torus_object_slider; 
GLabel framerate; 
GLabel label5; 
GLabel label6; 
GCheckbox ambientlight; 
GLabel label7; 
GCheckbox specularlight; 
GSlider exponent; 
GLabel label8; 
GLabel label9; 
GButton randomButton; 
GLabel label10; 
GCheckbox rotateOn; 
GLabel label11; 
