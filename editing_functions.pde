int bounds(float value) {
    if (value < 0) {
        return 0;
    }
    if (value > 255) {
        return 255;
    }
    return int(value + 0.5);
}

void changeBrightness(int bright) {
    loadPixels();
    
    for (int y = 0; y < height; y++) { 
        for (int x = 0; x < width; x++) {
            // Get the R,G,B values from image
            float r,g,b;
            r = red(originalPix[x][y].colour);
            g = green(originalPix[x][y].colour);
            b = blue(originalPix[x][y].colour);
            
            r += bright;
            g += bright;
            b += bright;
            
            r = constrain(r, 0, 255);
            g = constrain(g, 0, 255);
            b = constrain(b, 0, 255);
            
            imagePix[x][y].colour = color(r,g,b);
        } 
    }
    
    updatePixels();
}

void changeHue(int degrees) {
    loadPixels();
    hueWheel.setHueRotation(degrees);
    
    for (int y = 0; y < height; y++) { 
        for (int x = 0; x < width; x++) {
            // Get the R,G,B values from image
            float r,g,b;
            r = red(imagePix[x][y].colour);
            g = green(imagePix[x][y].colour);
            b = blue(imagePix[x][y].colour);
            
            int[] rgb = hueWheel.applyFilter(r,g,b);
            imagePix[x][y].colour = color(rgb[0],rgb[1],rgb[2]);
        } 
    }
    
    updatePixels();
}

// BROKEN FEATURE (SATURATION)
// void changeSaturation(float strength) {
//     loadPixels();
//     satWheel.setSaturationRotation(strength);
    
//     for (int y = 0; y < height; y++) { 
//         for (int x = 0; x < width; x++) {
//             // Get the R,G,B values from image
//             float r,g,b;
            
//             r = red(imagePix.colour);
//             g = green(imagePix.colour);
//             b = blue(imagePix.colour);
            
//             int[] rgb = satWheel.applyFilter(r,g,b);
//             imagePix.colour = color(rgb[0],rgb[1],rgb[2]);
//         } 
//     }
//     updatePixels();
// }

void resetToOriginal() {
    changeBrightness(0);
    hueWheel.setHueRotation(0.0);
    
    loadPixels();
    surface.setSize(800,800);
    pixelsDrawn = false;
    cropped = false;     
    imgx = 0;
    imgy = 0;
    updatePixels();
}

void checkIfInBox(PVector x, PVector y) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            if (x.y < imagePix[i][j].pos.y && y.y > imagePix[i][j].pos.y && x.x < imagePix[i][j].pos.x && y.x > imagePix[i][j].pos.x) {
                imagePix[i][j].colour = color(red(imagePix[i][j].colour) / 2, green(imagePix[i][j].colour) / 2, blue(imagePix[i][j].colour) / 2);
            } 
        }
    }
}

void cropImage(PVector x, PVector y) {
    try{
        loadPixels();
        if(x.x < y.x & x.y < y.y) {  
            newWidth = int(y.x - x.x);
            newHeight = int(y.y - x.y);
            
            surface.setSize(newWidth, newHeight);
            
            imgx -= x.x;
            imgy -= x.y;
                
            pixelsDrawn = false;    
            cropped = true;
            
            updatePixels();
        }
    }catch(NullPointerException e){
        println("You need make bounds with mouse first");
    }
}
    
    
