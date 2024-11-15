PImage img;
int z;
boolean imageSelected, ran=false;
Pixel[][] Pix;

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

void setup() {
    selectInput("Select a file to process:", "fileSelected");
    size(1000,1000);
    

   }

 
 
void draw() {
    
  
    if (imageSelected == true && ran == false) {
      
    windowResize(img.width, img.height);
    println(width,height);
    image(img,0,0);
    
    Pix = new Pixel[width][height];
    
    for( int y = 0; y < height; y++){
      
     for(int x = 0; x < width; x++){
      
       
      PVector pos = new PVector(x, y);
      
      Pix[x][y] = new Pixel (pos, get(x, y)); 
      
     }}
    ran = true; 
  }
  
  if(imageSelected == true){

    for( int y = 0; y < height; y++){ 
     for(int x = 0; x <width; x++){
       stroke(Pix[x][y].col);
       point(Pix[x][y].pos.x, Pix[x][y].pos.y);
     }}
    
  }
}


color paint = color(0,255,0);
int brushsize = 1;
void mouseDragged(){

  PVector mousepos = new PVector(mouseX, mouseY);
  
  for(int y = 0; y  < height; y++){
   for (int x = 0; x < width; x++){
     
    float dist = Pix[x][y].pos.dist(mousepos);
    
    if(dist <= brushsize) {
         set(x,y, paint);
         Pix[x][y].col = paint;
    }
     
   }
  }
  
  
}

