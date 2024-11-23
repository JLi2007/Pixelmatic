// paint function
void mouseDragged() {
  if(pixelsDrawn){
    PVector mousePos = new PVector(mouseX, mouseY);
    loadPixels();
  
    if( mouseVal == 0) {    
      // Stores where your mouse starts and ends
      int startX = max(0, mouseX - brushSize);
      int endX = min(width, mouseX + brushSize);
      int startY = max(0, mouseY - brushSize);
      int endY = min(height, mouseY + brushSize);
      
      for (int y = startY; y < endY; y++) {
          for (int x = startX; x < endX; x++) {   
              float dist = imagePix[x][y].pos.dist(mousePos);  
              if (dist <= brushSize) {
                  paint = color(r, g, b);
                  pixels[y * width + x] = paint;
                  imagePix[x][y].colour = paint;
                  originalPix[x][y].colour = paint; 
              }  
          }
      }
    }
    updatePixels();
  }
}

PVector[] selectdata = new PVector[2]; 

void mousePressed(){
  if(pixelsDrawn){
    if(mouseVal == 1){
      selectdata[0] = new PVector(mouseX,mouseY); 
    }
  }
}

void mouseReleased(){
  if(pixelsDrawn){
    if (mouseVal == 1){
      selectdata[1] = new PVector(mouseX,mouseY);
      checkIfInBox(selectdata[0], selectdata[1]);
    }
  }
}
