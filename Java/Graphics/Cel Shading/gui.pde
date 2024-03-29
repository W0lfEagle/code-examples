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

synchronized public void win_draw1(GWinApplet appc, GWinData data) { //_CODE_:controlwindow:733559:
  appc.background(230);
} //_CODE_:controlwindow:733559:

public void fractionShader_change1(GCustomSlider source, GEvent event) { //_CODE_:fractionSlider:339597:
//  println("fractionSlider - GCustomSlider >> GEvent." + event + " @ " + millis());
  fraction = source.getValueF();
} //_CODE_:fractionSlider:339597:

public void color1_clicked1(GOption source, GEvent event) { //_CODE_:color1:616546:
//  println("color1 - GOption >> GEvent." + event + " @ " + millis());
  currentColor = 1;
} //_CODE_:color1:616546:

public void color2_clicked1(GOption source, GEvent event) { //_CODE_:color2:835116:
//  println("color2 - GOption >> GEvent." + event + " @ " + millis());
  currentColor = 2;
} //_CODE_:color2:835116:

public void color3_clicked1(GOption source, GEvent event) { //_CODE_:color3:677487:
//  println("color3 - GOption >> GEvent." + event + " @ " + millis());
  currentColor = 3;
} //_CODE_:color3:677487:

public void setTorus_clicked1(GOption source, GEvent event) { //_CODE_:setTorus:910277:
//  println("setTorus - GOption >> GEvent." + event + " @ " + millis());
  shape = "torus";
} //_CODE_:setTorus:910277:

public void setCube_clicked1(GOption source, GEvent event) { //_CODE_:setCube:575319:
//  println("setCube - GOption >> GEvent." + event + " @ " + millis());
  shape = "cube";
} //_CODE_:setCube:575319:

public void setBunny_clicked1(GOption source, GEvent event) { //_CODE_:setBunny:614198:
//  println("setBunny - GOption >> GEvent." + event + " @ " + millis());
  shape = "bunny";
} //_CODE_:setBunny:614198:

public void setF16_clicked1(GOption source, GEvent event) { //_CODE_:setF16:802936:
//  println("setF16 - GOption >> GEvent." + event + " @ " + millis());
  shape = "f16";
} //_CODE_:setF16:802936:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  controlwindow = new GWindow(this, "Control Window", 0, 0, 340, 220, false, JAVA2D);
  controlwindow.setActionOnClose(G4P.EXIT_APP);
  controlwindow.addDrawHandler(this, "win_draw1");
  label1 = new GLabel(controlwindow.papplet, 10, 11, 80, 20);
  label1.setText("Fraction");
  label1.setOpaque(false);
  fractionSlider = new GCustomSlider(controlwindow.papplet, 96, 3, 238, 38, "grey_blue");
  fractionSlider.setShowValue(true);
  fractionSlider.setShowLimits(true);
  fractionSlider.setLimits(1.0, 0.0, 10.0);
  fractionSlider.setNumberFormat(G4P.DECIMAL, 2);
  fractionSlider.setOpaque(false);
  fractionSlider.addEventHandler(this, "fractionShader_change1");
  label2 = new GLabel(controlwindow.papplet, 10, 60, 80, 30);
  label2.setText("Color Scheme");
  label2.setOpaque(false);
  togGroup1 = new GToggleGroup();
  color1 = new GOption(controlwindow.papplet, 100, 60, 120, 20);
  color1.setText("One");
  color1.setOpaque(false);
  color1.addEventHandler(this, "color1_clicked1");
  color2 = new GOption(controlwindow.papplet, 100, 85, 120, 20);
  color2.setText("Two");
  color2.setOpaque(false);
  color2.addEventHandler(this, "color2_clicked1");
  color3 = new GOption(controlwindow.papplet, 100, 110, 120, 20);
  color3.setText("Three");
  color3.setOpaque(false);
  color3.addEventHandler(this, "color3_clicked1");
  togGroup1.addControl(color1);
  color1.setSelected(true);
  togGroup1.addControl(color2);
  togGroup1.addControl(color3);
  label3 = new GLabel(controlwindow.papplet, 10, 145, 80, 20);
  label3.setText("Shape");
  label3.setOpaque(false);
  togGroup2 = new GToggleGroup();
  setTorus = new GOption(controlwindow.papplet, 100, 145, 60, 20);
  setTorus.setText("Torus");
  setTorus.setOpaque(false);
  setTorus.addEventHandler(this, "setTorus_clicked1");
  setCube = new GOption(controlwindow.papplet, 100, 170, 60, 20);
  setCube.setText("Cube");
  setCube.setOpaque(false);
  setCube.addEventHandler(this, "setCube_clicked1");
  setBunny = new GOption(controlwindow.papplet, 170, 145, 60, 20);
  setBunny.setText("Bunny");
  setBunny.setOpaque(false);
  setBunny.addEventHandler(this, "setBunny_clicked1");
  setF16 = new GOption(controlwindow.papplet, 170, 170, 60, 20);
  setF16.setText("F16");
  setF16.setOpaque(false);
  setF16.addEventHandler(this, "setF16_clicked1");
  togGroup2.addControl(setTorus);
  setTorus.setSelected(true);
  togGroup2.addControl(setCube);
  togGroup2.addControl(setBunny);
  togGroup2.addControl(setF16);
}

// Variable declarations 
// autogenerated do not edit
GWindow controlwindow;
GLabel label1; 
GCustomSlider fractionSlider; 
GLabel label2; 
GToggleGroup togGroup1; 
GOption color1; 
GOption color2; 
GOption color3; 
GLabel label3; 
GToggleGroup togGroup2; 
GOption setTorus; 
GOption setCube; 
GOption setBunny; 
GOption setF16; 

