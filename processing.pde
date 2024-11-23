import g4p_controls.*;
import http.requests.*;
import processing.video.*;

PImage img, pixelmaticLogo;
Pixel[][] imagePix, originalPix;
JSONObject response;
Capture cam;
boolean imageSelected;
boolean pixelsDrawn = false;
boolean cropped = false;
boolean showFilePage = false;
boolean showCameraPage = false;
boolean takePhoto = false;
boolean cameraInitialized = false;
int brushSize = 1;
int r,g,b,brightnessStrength, newWidth, newHeight, mouseVal;
float imgx = 0, imgy = 0;
RGBRotate hueWheel, satWheel;
color paint;
String filePath,postTitle, postDescription, imgurLink;

void setup() {
    size(800,800);
    // load the logo image
    pixelmaticLogo = loadImage("pixelmatic.png");
    pixelmaticLogo.resize(400,400);
    createGUI_Home();//Create home page GUI
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
        filePath = file.substring(fileIndex);
        imageSelected = true;   
    } 
}

void draw() {
    if(showFilePage){//Create toolbar GUI and the file select popup when the File button is selected on the home page
        createGUI();
        showFilePage = false;
        selectInput("Select a file to process:", "fileSelected");
    }
    if(showCameraPage){//Create toolbar GUI and make the main window reflect whats going on on the camera when "camera" button is selected
        
        // initialize the camera
        if(cameraInitialized == false){

            // list the available cameras on the user's device
            String[] cameras = Capture.list();

            if (cameras.length == 0) {
                println("There are no cameras available for capture.");
                showFilePage = true;
            }

            cam = new Capture(this, cameras[0]);
            cam.start();

            println("Camera started!");

            cameraInitialized = true;
            createGUI();
        }

        if(imageSelected == false && cam.available()) {
            cam.read();
            image(cam, 0, 0);
            surface.setSize(cam.width, cam.height);
            if(takePhoto){
                img = cam.get();
                takePhoto = false;
                imageSelected = true; 
                showCameraPage = false; 
                cam.stop(); 
            }
        }
    }

    if (imageSelected) {
        if (pixelsDrawn == false && cropped == false) {
            if(img==null){
                img = loadImage(filePath);
            }
            // resize the image proportionally if it's small
            if (img.width < 200 && img.height < 200) {
                // Triple both dimensions of the image
                img.resize(img.width * 3, img.height * 3);
            }
            else if (img.width < 400 && img.height < 400) {
                // Double both dimensions of the image
                img.resize(img.width * 2, img.height * 2);
            }

            // scale down the image proportionally if it's larger than the bounds of the screen
            if(img.width>displayWidth){
                img.resize(int(img.width * float(displayWidth)/float(img.width)), int(img.height * float(displayWidth)/float(img.width)));
            }
            if(img.height>displayHeight){
                img.resize(int(img.width * float(displayHeight)/float(img.height)), int(img.height * float(displayHeight)/float(img.height)));
            }

            surface.setSize(img.width, img.height);

            image(img,0,0);
            imagePix = new Pixel[width][height]; 
            originalPix = new Pixel[width][height];

            for (int y = 0; y < height; y++) {  
                for (int x = 0; x < width; x++) {
                    PVector pos = new PVector(x, y);
                    // make a Pix 2d array for the changing color values and originalPix 2d array to store the original color values
                    imagePix[x][y] = new Pixel(pos, get(x, y));  
                    originalPix[x][y] = new Pixel(pos, get(x,y));  
                } 
            }
            pixelsDrawn = true; 
        } 
      
        if (pixelsDrawn == false && cropped == true) {
            // resize the image proportionally
            image(img,imgx,imgy);
            
            imagePix = new Pixel[width][height]; 
            originalPix = new Pixel[width][height];  
            for (int y = 0; y < height; y++) {  
                for (int x = 0; x < width; x++) {
                    PVector pos = new PVector(x, y);
                    // make Pix for changing color values and originalPix to store the original color values of the image   
                    imagePix[x][y] = new Pixel(pos, get(x, y));  
                    originalPix[x][y] = new Pixel(pos, get(x,y));  
                } 
            }
            pixelsDrawn = true; 
        } 
        
        if (pixelsDrawn == true) {
            loadPixels();
            for (int y = 0; y < height; y++) { 
                for (int x = 0; x < width; x++) {
                    pixels[y * width + x] = imagePix[x][y].colour;
                } 
            }
            updatePixels();
        }
    } 
}
