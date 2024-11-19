void changeBrightness(int bright){
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
            
            Pix[x][y].colour = color(r,g,b);
        } 
    }
    
    updatePixels();
}

void changeHue(int degrees){
    hueWheel = new RGBRotate();
    loadPixels();
    hueWheel.setHueRotation(degrees);

    for (int y = 0; y < height; y++) { 
        for (int x = 0; x < width; x++) {
            // Get the R,G,B values from image
            float r,g,b;
            r = red(originalPix[x][y].colour);
            g = green(originalPix[x][y].colour);
            b = blue(originalPix[x][y].colour);

            int[] rgb = hueWheel.applyFilter(r,g,b);
            Pix[x][y].colour = color(rgb[0],rgb[1],rgb[2]);
        } 
    }
    
    updatePixels();
}

void changeSaturation(int strength){
    satWheel = new RGBRotate();
    loadPixels();
    satWheel.setSaturationRotation(strength);

    for (int y = 0; y < height; y++) { 
        for (int x = 0; x < width; x++) {
            // Get the R,G,B values from image
            float r,g,b;
            r = red(Pix[x][y].colour);
            g = green(Pix[x][y].colour);
            b = blue(Pix[x][y].colour);

            int[] rgb = satWheel.applyFilter(r,g,b);
            Pix[x][y].colour = color(rgb[0],rgb[1],rgb[2]);

        } 
    }
    updatePixels();
}

int bounds(float value){
    if (value < 0){
        return 0;
    }
    if (value > 255){
        return 255;
    }
    return int(value + 0.5);
}



    // color c = -16777005; // Example color
    // int r = (c >> 16) & 0xFF; // Extract Red (bits 16-23)
    // int g = (c >> 8) & 0xFF;  // Extract Green (bits 8-15)
    // int b = c & 0xFF;         // Extract Blue (bits 0-7)

    // println("Red: " + r);
    // println("Green: " + g);
    // println("Blue: " + b);