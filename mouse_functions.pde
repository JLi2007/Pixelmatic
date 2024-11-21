// paint function
void mouseDragged() {
    PVector mousePos = new PVector(mouseX, mouseY);
    loadPixels();
    
    
    if( mouseval == 0) {
      
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
    }}
    updatePixels();
}


PVector[] selectdata = new PVector[2]; 

void mousePressed(){
  if(mouseval == 1){
  selectdata[0] = new PVector(mouseX,mouseY);
    
}}

void mouseReleased(){
  if (mouseval ==1){
  selectdata[1] = new PVector(mouseX,mouseY);
  checkifinbox(selectdata[0], selectdata[1]);
  printArray(selectdata);
}}