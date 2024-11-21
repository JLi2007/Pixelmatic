import g4p_controls.*;
import http.requests.*;
import processing.video.*;

PImage img, pixelmaticLogo;
Pixel[][] Pix;
Pixel[][] originalPix;
JSONObject response;
Capture cam;
boolean imageSelected;
boolean pixelsDrawn = false;
boolean cropped = false;
boolean showFilePage = false;
boolean showCameraPage = false;
boolean takePhoto = false;
int r,g,b,brightnessStrength, width1, height1, mouseval;
int brushSize = 1;
float imgx = 0;
float imgy = 0;
RGBRotate hueWheel, satWheel;
color paint;
String postTitle, postDescription, imgurLink;

void setup() {
    // selectInput("Select a file to process:", "fileSelected");
    size(800,800);
    pixelmaticLogo = loadImage("pixelmatic.png");
    createGUI_Home();
    colorMode(RGB, 255,255,255);
    hueWheel = new RGBRotate();
    satWheel = new RGBRotate();
}

void fileSelected(File selection) {
    if (selection == null) {
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
    if(showFilePage==true){
        createGUI();
        showFilePage = false;
        selectInput("Select a file to process:", "fileSelected");
    }
    if(showCameraPage == true){
        createGUI();
        showCameraPage = false;
        String[] cameras = Capture.list();
  
        if (cameras.length == 0) {
            println("There are no cameras available for capture.");
            exit();
        } else {
            cam = new Capture(this, cameras[0]);
            cam.start();
            print("*");
            
            if (cam.available() == true) {
                if(takePhoto ==true){
                    cam.read();
                    img = cam;
                    takePhoto = false;
                    imageSelected = true;   
                }
            }
        }
    }

    if (imageSelected == true) {
        if (pixelsDrawn == false && cropped == false) {
            // resize the image proportionally
            if (img.width < width / 4 && img.height < height / 4) {
                // Triple both dimensions of the image
                img.resize(img.width * 3, img.height * 3);
            }
            else if (img.width < width / 2 && img.height < height / 2) {
                // Double both dimensions of the image
                img.resize(img.width * 2, img.height * 2);
            }
            surface.setSize(img.width, img.height);
            
            // image(img,((width-img.width)/2),((height-img.height)/2));
            image(img,0,0);
            Pix = new Pixel[width][height]; 
            originalPix = new Pixel[width][height];  
            for (int y = 0; y < height; y++) {  
                for (int x = 0; x < width; x++) {
                    PVector pos = new PVector(x, y);
                    // make Pix for changing color values and originalPix to store the original color values of the image   
                    Pix[x][y] = new Pixel(pos, get(x, y));  
                    originalPix[x][y] = new Pixel(pos, get(x,y));  
                } 
            }
            pixelsDrawn = true; 
        } 
      
        if (pixelsDrawn == false && cropped == true) {
            // resize the image proportionally
            image(img,imgx,imgy);
            
            Pix = new Pixel[width][height]; 
            originalPix = new Pixel[width][height];  
            for (int y = 0; y < height; y++) {  
                for (int x = 0; x < width; x++) {
                    PVector pos = new PVector(x, y);
                    // make Pix for changing color values and originalPix to store the original color values of the image   
                    Pix[x][y] = new Pixel(pos, get(x, y));  
                    originalPix[x][y] = new Pixel(pos, get(x,y));  
                } 
            }
            pixelsDrawn = true; 
        } 
        
        if (pixelsDrawn == true) {
            loadPixels();
            for (int y = 0; y < height; y++) { 
                for (int x = 0; x < width; x++) {
                    pixels[y * width + x] = Pix[x][y].colour;
                    
                } 
            }
            updatePixels();
        }
    } 
}