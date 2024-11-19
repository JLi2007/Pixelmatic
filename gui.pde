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

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:652321:
  appc.background(230);
  appc.fill(r,g,b);
  appc.stroke(r,g,b);
  appc.rect(10, 75, 380, 20);
  appc.circle(200,150,brushSize*2);
} //_CODE_:window1:652321:

public void Red_Change(GSlider source, GEvent event) { //_CODE_:Red:215448:
  r = Red.getValueI();
} //_CODE_:Red:215448:

public void Green_Change(GSlider source, GEvent event) { //_CODE_:Green:673080:
  g = Green.getValueI();
 } //_CODE_:Green:673080:

public void Blue_Change(GSlider source, GEvent event) { //_CODE_:Blue:859104:
  b = Blue.getValueI();
} //_CODE_:Blue:859104:

public void BrushChange(GSlider source, GEvent event) { //_CODE_:Brush_Size:736456:
  brushSize = Brush_Size.getValueI();
} //_CODE_:Brush_Size:736456:

public void Change_Brightness(GSlider source, GEvent event) { //_CODE_:brightness_:516721:
  changeBrightness(Bright.getValueI());
} //_CODE_:brightness_:516721:

public void Change_Hue(GKnob source, GEvent event) { //_CODE_:Huee:883956:
  changeHue(Hue.getValueI());
} //_CODE_:Huee:883956:

public void Change_Saturation(GSlider source, GEvent event) { //_CODE_:Huee:883956:
  changeSaturation(Saturation.getValueI());
} //_CODE_:Huee:883956:

// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Pixelmatic");
  window1 = GWindow.getWindow(this, "Pixelmatic Toolbar", 0, 0, 400, 400, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");

  // COLOR GUI START
  Red = new GSlider(window1, 0, 25, 100, 40, 10.0);
  Red.setShowValue(true);
  Red.setLimits(0, 0, 255);
  Red.setNbrTicks(255);
  Red.setNumberFormat(G4P.INTEGER, 0);
  Red.setLocalColorScheme(GCScheme.RED_SCHEME);
  Red.setOpaque(false);
  Red.addEventHandler(this, "Red_Change");
  Green = new GSlider(window1, 125, 25, 100, 40, 10.0);
  Green.setShowValue(true);
  Green.setLimits(0, 0, 255);
  Green.setNbrTicks(255);
  Green.setNumberFormat(G4P.INTEGER, 0);
  Green.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  Green.setOpaque(false);
  Green.addEventHandler(this, "Green_Change");
  Blue = new GSlider(window1, 250, 25, 100, 40, 10.0);
  Blue.setShowValue(true);
  Blue.setLimits(0, 0, 255);
  Blue.setNbrTicks(255);
  Blue.setNumberFormat(G4P.INTEGER, 0);
  Blue.setOpaque(false);
  Blue.addEventHandler(this, "Blue_Change");
  red_label = new GLabel(window1, 0, 50, 80, 20);
  red_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  red_label.setText("Red");
  red_label.setOpaque(false);
  red_label.setLocalColorScheme(GCScheme.RED_SCHEME);
  green_label = new GLabel(window1, 125, 50, 80, 20);
  green_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  green_label.setText("Green");
  green_label.setOpaque(false);
  green_label.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  blue_label = new GLabel(window1, 250, 50, 80, 20);
  blue_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blue_label.setText("Blue");
  blue_label.setOpaque(false);
  blue_label.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  // COLOR GUI END

  Brush_Size = new GSlider(window1, 50, 125, 100, 40, 10.0);
  Brush_Size.setShowValue(true);
  Brush_Size.setLimits(1, 1, 20);
  Brush_Size.setNbrTicks(20);
  Brush_Size.setNumberFormat(G4P.INTEGER, 0);
  Brush_Size.setOpaque(false);
  Brush_Size.addEventHandler(this, "BrushChange");
  Bright = new GSlider(window1, 0, 250, 100, 40, 10.0);
  Bright.setLimits(0, -100, 100);
  Bright.setNumberFormat(G4P.INTEGER, 0);
  Bright.setOpaque(false);
  Bright.addEventHandler(this, "Change_Brightness");
  Hue = new GKnob(window1, 125, 250, 60, 60, 0.8);
  Hue.setTurnRange(110, 70);
  Hue.setTurnMode(GKnob.CTRL_HORIZONTAL);
  Hue.setSensitivity(1);
  Hue.setShowArcOnly(false);
  Hue.setOverArcOnly(false);
  Hue.setIncludeOverBezel(false);
  Hue.setShowTrack(true);
  Hue.setLimits(0.0, -180.0, 180.0);
  Hue.setShowTicks(true);
  Hue.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  Hue.setOpaque(false);
  Hue.addEventHandler(this, "Change_Hue");
  Saturation = new GSlider(window1, 250, 250, 100, 40, 10.0);
  Saturation.setLimits(0.75, 0.1, 2.0);
  Saturation.setNumberFormat(G4P.INTEGER, 0);
  Saturation.setOpaque(false);
  Saturation.addEventHandler(this, "Change_Saturation");

  brushSize_label = new GLabel(window1, 50, 150, 80, 20);
  brushSize_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  brushSize_label.setText("Brush Size");
  brushSize_label.setOpaque(false);
  brightness_label = new GLabel(window1, 0, 235, 80, 20);
  brightness_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  brightness_label.setText("Brightness");
  brightness_label.setOpaque(false);
  hue_label = new GLabel(window1, 125, 235, 80, 20);
  hue_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  hue_label.setText("Hue");
  hue_label.setOpaque(false);
  saturation_label = new GLabel(window1, 250, 235, 80, 20);
  saturation_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  saturation_label.setText("Saturation");
  saturation_label.setOpaque(false);

  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GSlider Red; 
GSlider Green; 
GSlider Blue; 
GSlider Brush_Size; 
GSlider Bright; 
GKnob Hue; 
GSlider Saturation;

GLabel red_label; 
GLabel green_label; 
GLabel blue_label; 
GLabel brushSize_label; 
GLabel brightness_label; 
GLabel hue_label; 
GLabel saturation_label; 

