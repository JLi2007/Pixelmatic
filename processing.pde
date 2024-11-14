import controlP5.*;

ControlP5 cp5;

ColorPicker cp;
int s;
PImage img;
int z;
boolean imageSelected = false;
float x,y;
Pixel[] pix = new Pixel [width * height];

void setup() {
    // default size for now
    size(500,500);

    selectInput("Select a file to process:", "fileSelected");
    cp5 = new ControlP5(this);
    cp = cp5.addColorPicker("picker")
          .setPosition(60, height-60)
          .setColorValue(color(255, 0, 0, 255))
          ;
}

void fileSelected(File selection) {
    
    if(selection == null) {
        println("Window was closed or the user hit cancel.");
    } 
    else { 
        String file = selection.getAbsolutePath();    
        
        int fileIndex = file.indexOf("data");

        String filePath = file.substring(fileIndex);
        img = loadImage(filePath);
        imageSelected = true;   
    } 
}


void draw() {
    // draw the image on the screen
    if (imageSelected == true) {
        image(img,0,0);
    }
}




