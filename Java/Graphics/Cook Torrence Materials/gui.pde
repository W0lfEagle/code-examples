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

synchronized public void win_draw1(GWinApplet appc, GWinData data) { //_CODE_:window1:988390:
  appc.background(230);
} //_CODE_:window1:988390:

public void torus_res_slider_change1(GCustomSlider source, GEvent event) { //_CODE_:torus_res_slider:309261:
//  println("custom_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
  if (event == GEvent.VALUE_STEADY) {
    setTorusRes(source.getValueI());
  }
} //_CODE_:torus_res_slider:309261:

public void lights_slider_change1(GSlider source, GEvent event) { //_CODE_:lights_slider:654630:
//  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
  if (event == GEvent.VALUE_STEADY) {
    numLights = source.getValueI();
  }
} //_CODE_:lights_slider:654630:

public void torus_object_slider_change1(GCustomSlider source, GEvent event) { //_CODE_:torus_object_slider:733689:
//  println("custom_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
  numTori = source.getValueI();
} //_CODE_:torus_object_slider:733689:

public void randomButton_click1(GButton source, GEvent event) { //_CODE_:randomButton:388439:
//  println("randomButton - GButton >> GEvent." + event + " @ " + millis());
  setRandom();
} //_CODE_:randomButton:388439:

public void rotateOn_clicked1(GCheckbox source, GEvent event) { //_CODE_:rotateOn:934226:
//  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
  if (source.isSelected() == true) {
    setRotate(true);
  }
  else if(source.isSelected() == false) {
    setRotate(false);
  }
} //_CODE_:rotateOn:934226:

public void option1_clicked1(GOption source, GEvent event) { //_CODE_:option1:203968:
//  println("option1 - GOption >> GEvent." + event + " @ " + millis());
  println("Material = emerald");
  material = "emerald";
} //_CODE_:option1:203968:

public void option2_clicked1(GOption source, GEvent event) { //_CODE_:option2:647949:
//  println("option2 - GOption >> GEvent." + event + " @ " + millis());
  println("Material = brass");
  material = "brass";
} //_CODE_:option2:647949:

public void option3_clicked1(GOption source, GEvent event) { //_CODE_:option3:587528:
//  println("option3 - GOption >> GEvent." + event + " @ " + millis());
  println("Material = chrome");
  material = "chrome";
} //_CODE_:option3:587528:

public void option4_clicked1(GOption source, GEvent event) { //_CODE_:option4:804832:
//  println("option4 - GOption >> GEvent." + event + " @ " + millis());
  println("Material = plastic");
  material = "plastic";
} //_CODE_:option4:804832:

public void option5_clicked1(GOption source, GEvent event) { //_CODE_:option5:843768:
//  println("option5 - GOption >> GEvent." + event + " @ " + millis());
  println("Material = pearl");
  material = "pearl";
} //_CODE_:option5:843768:

public void setMaterial_clicked1(GOption source, GEvent event) { //_CODE_:setMaterial:473988:
//  println("setMaterial - GOption >> GEvent." + event + " @ " + millis());
//  setMaterial(amb, dif, spec, shininess);
  material = "custom";
} //_CODE_:setMaterial:473988:

public void ambR_change1(GSlider source, GEvent event) { //_CODE_:ambR:919978:
//  println("ambR - GSlider >> GEvent." + event + " @ " + millis());
  amb[0] = source.getValueF();
} //_CODE_:ambR:919978:

public void ambG_change1(GSlider source, GEvent event) { //_CODE_:ambG:681717:
//  println("ambG - GSlider >> GEvent." + event + " @ " + millis());
  amb[1] = source.getValueF();
} //_CODE_:ambG:681717:

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:ambB:491929:
//  println("ambB - GSlider >> GEvent." + event + " @ " + millis());
  amb[2] = source.getValueF();
} //_CODE_:ambB:491929:

public void difR_change1(GSlider source, GEvent event) { //_CODE_:difR:484267:
//  println("difR - GSlider >> GEvent." + event + " @ " + millis());
  dif[0] = source.getValueF();
} //_CODE_:difR:484267:

public void difG_change1(GSlider source, GEvent event) { //_CODE_:difG:746515:
//  println("difG - GSlider >> GEvent." + event + " @ " + millis());
  dif[1] = source.getValueF();
} //_CODE_:difG:746515:

public void difB_change1(GSlider source, GEvent event) { //_CODE_:difB:815088:
//  println("difB - GSlider >> GEvent." + event + " @ " + millis());
  dif[2] = source.getValueF();
} //_CODE_:difB:815088:

public void specR_change1(GSlider source, GEvent event) { //_CODE_:specR:694776:
//  println("specR - GSlider >> GEvent." + event + " @ " + millis());
  spec[0] = source.getValueF();
} //_CODE_:specR:694776:

public void specG_change1(GSlider source, GEvent event) { //_CODE_:specG:755965:
//  println("specG - GSlider >> GEvent." + event + " @ " + millis());
  spec[1] = source.getValueF();
} //_CODE_:specG:755965:

public void specB_change1(GSlider source, GEvent event) { //_CODE_:specB:905145:
//  println("specB - GSlider >> GEvent." + event + " @ " + millis());
  spec[2] = source.getValueF();
} //_CODE_:specB:905145:

public void shin_change1(GSlider source, GEvent event) { //_CODE_:shin:986896:
//  println("shin - GSlider >> GEvent." + event + " @ " + millis());
  shininess = source.getValueF();
} //_CODE_:shin:986896:

public void lightP_change1(GSlider source, GEvent event) { //_CODE_:lightP:571540:
//  println("lightPower - GSlider >> GEvent." + event + " @ " + millis());
  if (event == GEvent.VALUE_STEADY) {
    lightPower = source.getValueF();
  }
} //_CODE_:lightP:571540:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  window1 = new GWindow(this, "Control Window", 0, 0, 540, 700, false, JAVA2D);
  window1.addDrawHandler(this, "win_draw1");
  label1 = new GLabel(window1.papplet, 12, 20, 80, 60);
  label1.setText("Torus Resolution");
  label1.setOpaque(false);
  torus_res_slider = new GCustomSlider(window1.papplet, 105, 20, 310, 60, "grey_blue");
  torus_res_slider.setShowValue(true);
  torus_res_slider.setShowLimits(true);
  torus_res_slider.setLimits(100, 10, 500);
  torus_res_slider.setNbrTicks(500);
  torus_res_slider.setNumberFormat(G4P.INTEGER, 0);
  torus_res_slider.setOpaque(false);
  torus_res_slider.addEventHandler(this, "torus_res_slider_change1");
  label2 = new GLabel(window1.papplet, 427, 21, 80, 55);
  label2.setText("Warning! If Tori vanish, restart.");
  label2.setOpaque(false);
  label3 = new GLabel(window1.papplet, 12, 100, 80, 60);
  label3.setText("Lights");
  label3.setOpaque(false);
  lights_slider = new GSlider(window1.papplet, 105, 100, 310, 60, 10.0);
  lights_slider.setShowValue(true);
  lights_slider.setShowLimits(true);
  lights_slider.setLimits(1, 1, 8);
  lights_slider.setNbrTicks(8);
  lights_slider.setStickToTicks(true);
  lights_slider.setShowTicks(true);
  lights_slider.setNumberFormat(G4P.INTEGER, 0);
  lights_slider.setOpaque(false);
  lights_slider.addEventHandler(this, "lights_slider_change1");
  label4 = new GLabel(window1.papplet, 12, 175, 80, 60);
  label4.setText("Torus Objects");
  label4.setOpaque(false);
  torus_object_slider = new GCustomSlider(window1.papplet, 105, 175, 310, 60, "grey_blue");
  torus_object_slider.setShowValue(true);
  torus_object_slider.setShowLimits(true);
  torus_object_slider.setLimits(1, 1, 100);
  torus_object_slider.setNbrTicks(100);
  torus_object_slider.setNumberFormat(G4P.INTEGER, 0);
  torus_object_slider.setOpaque(false);
  torus_object_slider.addEventHandler(this, "torus_object_slider_change1");
  label5 = new GLabel(window1.papplet, 12, 250, 80, 30);
  label5.setText("Randomize positions");
  label5.setOpaque(false);
  randomButton = new GButton(window1.papplet, 105, 250, 80, 30);
  randomButton.setText("Random");
  randomButton.setTextBold();
  randomButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  randomButton.addEventHandler(this, "randomButton_click1");
  label6 = new GLabel(window1.papplet, 12, 295, 80, 20);
  label6.setText("Rotate");
  label6.setOpaque(false);
  rotateOn = new GCheckbox(window1.papplet, 105, 295, 120, 20);
  rotateOn.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  rotateOn.setOpaque(false);
  rotateOn.addEventHandler(this, "rotateOn_clicked1");
  label7 = new GLabel(window1.papplet, 12, 330, 80, 20);
  label7.setText("Material");
  label7.setOpaque(false);
  togGroup1 = new GToggleGroup();
  option1 = new GOption(window1.papplet, 105, 330, 70, 20);
  option1.setText("Emerald");
  option1.setOpaque(false);
  option1.addEventHandler(this, "option1_clicked1");
  option2 = new GOption(window1.papplet, 185, 330, 70, 20);
  option2.setText("Brass");
  option2.setOpaque(false);
  option2.addEventHandler(this, "option2_clicked1");
  option3 = new GOption(window1.papplet, 265, 330, 70, 20);
  option3.setText("Chrome");
  option3.setOpaque(false);
  option3.addEventHandler(this, "option3_clicked1");
  option4 = new GOption(window1.papplet, 345, 330, 70, 20);
  option4.setText("Plastic");
  option4.setOpaque(false);
  option4.addEventHandler(this, "option4_clicked1");
  option5 = new GOption(window1.papplet, 425, 330, 70, 20);
  option5.setText("Pearl");
  option5.setOpaque(false);
  option5.addEventHandler(this, "option5_clicked1");
  setMaterial = new GOption(window1.papplet, 384, 544, 120, 20);
  setMaterial.setText("Set Material");
  setMaterial.setTextBold();
  setMaterial.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  setMaterial.setOpaque(false);
  setMaterial.addEventHandler(this, "setMaterial_clicked1");
  togGroup1.addControl(option1);
  option1.setSelected(true);
  togGroup1.addControl(option2);
  togGroup1.addControl(option3);
  togGroup1.addControl(option4);
  togGroup1.addControl(option5);
  togGroup1.addControl(setMaterial);
  label8 = new GLabel(window1.papplet, 12, 653, 80, 20);
  label8.setText("Frame Rate");
  label8.setOpaque(false);
  framerate = new GLabel(window1.papplet, 105, 653, 80, 20);
  framerate.setText("calculating...");
  framerate.setOpaque(false);
  label9 = new GLabel(window1.papplet, 12, 365, 80, 40);
  label9.setText("Manual Material Controls");
  label9.setOpaque(false);
  ambR = new GSlider(window1.papplet, 145, 390, 135, 38, 10.0);
  ambR.setShowValue(true);
  ambR.setRotation(PI/2, GControlMode.CORNER);
  ambR.setLimits(0.0, 0.0, 1.0);
  ambR.setNumberFormat(G4P.DECIMAL, 4);
  ambR.setLocalColorScheme(GCScheme.RED_SCHEME);
  ambR.setOpaque(false);
  ambR.addEventHandler(this, "ambR_change1");
  ambG = new GSlider(window1.papplet, 185, 390, 135, 38, 10.0);
  ambG.setShowValue(true);
  ambG.setRotation(PI/2, GControlMode.CORNER);
  ambG.setLimits(0.0, 0.0, 1.0);
  ambG.setNumberFormat(G4P.DECIMAL, 4);
  ambG.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  ambG.setOpaque(false);
  ambG.addEventHandler(this, "ambG_change1");
  ambB = new GSlider(window1.papplet, 225, 390, 135, 38, 10.0);
  ambB.setShowValue(true);
  ambB.setRotation(PI/2, GControlMode.CORNER);
  ambB.setLimits(0.0, 0.0, 1.0);
  ambB.setNumberFormat(G4P.DECIMAL, 4);
  ambB.setOpaque(false);
  ambB.addEventHandler(this, "slider1_change1");
  label10 = new GLabel(window1.papplet, 124, 365, 80, 20);
  label10.setText("Ambient");
  label10.setOpaque(false);
  difR = new GSlider(window1.papplet, 283, 390, 135, 33, 10.0);
  difR.setShowValue(true);
  difR.setTextOrientation(G4P.BLUE_SCHEME);
  difR.setRotation(PI/2, GControlMode.CORNER);
  difR.setLimits(0.0, 0.0, 1.0);
  difR.setNumberFormat(G4P.DECIMAL, 4);
  difR.setLocalColorScheme(GCScheme.RED_SCHEME);
  difR.setOpaque(false);
  difR.addEventHandler(this, "difR_change1");
  difG = new GSlider(window1.papplet, 323, 390, 135, 38, 10.0);
  difG.setShowValue(true);
  difG.setRotation(PI/2, GControlMode.CORNER);
  difG.setLimits(0.0, 0.0, 1.0);
  difG.setNumberFormat(G4P.DECIMAL, 4);
  difG.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  difG.setOpaque(false);
  difG.addEventHandler(this, "difG_change1");
  difB = new GSlider(window1.papplet, 363, 390, 135, 38, 10.0);
  difB.setShowValue(true);
  difB.setRotation(PI/2, GControlMode.CORNER);
  difB.setLimits(0.0, 0.0, 1.0);
  difB.setNumberFormat(G4P.DECIMAL, 4);
  difB.setOpaque(false);
  difB.addEventHandler(this, "difB_change1");
  label11 = new GLabel(window1.papplet, 267, 365, 80, 20);
  label11.setText("Diffuse");
  label11.setOpaque(false);
  specR = new GSlider(window1.papplet, 423, 390, 135, 38, 10.0);
  specR.setShowValue(true);
  specR.setRotation(PI/2, GControlMode.CORNER);
  specR.setLimits(0.0, 0.0, 1.0);
  specR.setNumberFormat(G4P.DECIMAL, 4);
  specR.setLocalColorScheme(GCScheme.RED_SCHEME);
  specR.setOpaque(false);
  specR.addEventHandler(this, "specR_change1");
  specG = new GSlider(window1.papplet, 463, 390, 135, 38, 10.0);
  specG.setShowValue(true);
  specG.setRotation(PI/2, GControlMode.CORNER);
  specG.setLimits(0.0, 0.0, 1.0);
  specG.setNumberFormat(G4P.DECIMAL, 4);
  specG.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  specG.setOpaque(false);
  specG.addEventHandler(this, "specG_change1");
  specB = new GSlider(window1.papplet, 503, 390, 135, 38, 10.0);
  specB.setShowValue(true);
  specB.setRotation(PI/2, GControlMode.CORNER);
  specB.setLimits(0.0, 0.0, 1.0);
  specB.setNbrTicks(100);
  specB.setNumberFormat(G4P.DECIMAL, 4);
  specB.setOpaque(false);
  specB.addEventHandler(this, "specB_change1");
  label12 = new GLabel(window1.papplet, 402, 365, 80, 20);
  label12.setText("Specular");
  label12.setOpaque(false);
  label13 = new GLabel(window1.papplet, 124, 540, 80, 20);
  label13.setText("Shininess");
  label13.setOpaque(false);
  shin = new GSlider(window1.papplet, 209, 532, 100, 40, 10.0);
  shin.setShowValue(true);
  shin.setLimits(0.0, 0.0, 1.0);
  shin.setNumberFormat(G4P.DECIMAL, 4);
  shin.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  shin.setOpaque(false);
  shin.addEventHandler(this, "shin_change1");
  label14 = new GLabel(window1.papplet, 12, 580, 80, 60);
  label14.setText("Light Power");
  label14.setOpaque(false);
  lightP = new GSlider(window1.papplet, 105, 580, 330, 60, 10.0);
  lightP.setShowValue(true);
  lightP.setShowLimits(true);
  lightP.setLimits(7000, 1000, 25000);
  lightP.setNumberFormat(G4P.INTEGER, 0);
  lightP.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  lightP.setOpaque(false);
  lightP.addEventHandler(this, "lightP_change1");
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GLabel label1; 
GCustomSlider torus_res_slider; 
GLabel label2; 
GLabel label3; 
GSlider lights_slider; 
GLabel label4; 
GCustomSlider torus_object_slider; 
GLabel label5; 
GButton randomButton; 
GLabel label6; 
GCheckbox rotateOn; 
GLabel label7; 
GToggleGroup togGroup1; 
GOption option1; 
GOption option2; 
GOption option3; 
GOption option4; 
GOption option5; 
GOption setMaterial; 
GLabel label8; 
GLabel framerate; 
GLabel label9; 
GSlider ambR; 
GSlider ambG; 
GSlider ambB; 
GLabel label10; 
GSlider difR; 
GSlider difG; 
GSlider difB; 
GLabel label11; 
GSlider specR; 
GSlider specG; 
GSlider specB; 
GLabel label12; 
GLabel label13; 
GSlider shin; 
GLabel label14; 
GSlider lightP; 

