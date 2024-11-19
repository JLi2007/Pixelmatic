import g4p_controls.*;

PImage img;
boolean imageSelected, pixelsDrawn = false;
Pixel[][] Pix;
Pixel[][] originalPix;
int r,g,b;
color paint;
int brushSize = 1;
int brightnessStrength;
RGBRotate hueWheel, satWheel;

void setup() {
    selectInput("Select a file to process:", "fileSelected");
    size(800,800);
    createGUI();
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
    if (imageSelected == true) {
        if (pixelsDrawn == false) {
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

        else{
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

// paint function
void mouseDragged() {
    PVector mousePos = new PVector(mouseX, mouseY);
    loadPixels();
    
    // Stores where your mouse starts and ends
    int startX = max(0, mouseX - brushSize);
    int endX = min(width, mouseX + brushSize);
    int startY = max(0, mouseY - brushSize);
    int endY = min(height, mouseY + brushSize);
    
    for (int y = startY; y < endY; y++) {
        for (int x = startX; x < endX; x++) {   
            float dist = Pix[x][y].pos.dist(mousePos);  
            if (dist <= brushSize) {
                paint = color(r, g, b);
                pixels[y * width + x] = paint;
                Pix[x][y].colour = paint;
                originalPix[x][y].colour = paint; 
            }  
        }
    }
    updatePixels();
}





// import processing.video.*;

// Capture cam;

// PImage img;
// boolean imageSelected, pixelsDrawn = false;
// Pixel[][] Pix;
// Pixel[][] originalPix;
// int r,g,b;
// color paint;
// int brushSize = 1;
// int brightnessStrength;
// RGBRotate hueWheel;

// void setup() {
//     // selectInput("Select a file to process:", "fileSelected");
//     imageSelected=true;
//     String[] cameras = Capture.list();
//     // The camera can be initialized directly using an 
//     // element from the array returned by list():
//     cam = new Capture(this, cameras[0]);
//     cam.start();        
//     size(800,800);
//     createGUI();
//     colorMode(RGB, 255,255,255);
// }

// // void fileSelected(File selection) {
// //     if (selection == null) {
// //         println("Window was closed or the user hit cancel.");
// //     } 
    
// //     else { 
// //         String file = selection.getAbsolutePath();    
// //         int fileIndex = file.indexOf("data");
// //         String filePath = file.substring(fileIndex);
// //         img = loadImage(filePath);
// //         imageSelected = true;   
// //     } 
// // }

// void draw() {
//     if (imageSelected == true) {
//         if (pixelsDrawn == false) {
//             // resize the image proportionally
//             if (cam.width < width / 4 && cam.height < height / 4) {
//                 // Triple both dimensions of the image
//                 cam.resize(cam.width * 3, cam.height * 3);
//             }
//             else if (cam.width < width / 2 && cam.height < height / 2) {
//                 // Double both dimensions of the image
//                 cam.resize(cam.width * 2, cam.height * 2);
//             }
//             surface.setSize(cam.width, cam.height);

//             // image(img,((width-img.width)/2),((height-img.height)/2));
//             if (cam.available() == true) {
//                 cam.read();
//             }
            
//             image(cam,0,0);
//             Pix = new Pixel[width][height]; 
//             originalPix = new Pixel[width][height];  
//             for (int y = 0; y < height; y++) {  
//                 for (int x = 0; x < width; x++) {
//                     PVector pos = new PVector(x, y);
//                     // make Pix for changing color values and originalPix to store the original color values of the image   
//                     Pix[x][y] = new Pixel(pos, get(x, y));  
//                     originalPix[x][y] = new Pixel(pos, get(x,y));  
//                 } 
//             }
//             pixelsDrawn = true; 
//         } 

//         else{
//             loadPixels();
//             for (int y = 0; y < height; y++) { 
//                 for (int x = 0; x < width; x++) {
//                     pixels[y * width + x] = Pix[x][y].colour;
//                 } 
//             }
//             updatePixels();
//         }
//     }
// }