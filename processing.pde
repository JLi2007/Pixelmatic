import g4p_controls.*;

PImage img;
int z;
boolean imageSelected, pixelSelected=false;
Pixel[][] Pix;
int r,g,b;
color paint;
int brushsize;

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
    createGUI();
}
 
void draw() {
    if (imageSelected == true && pixelSelected == false) {
        while(img.width < width*3/4){
            img.width+=50;
        }
        while(img.height < height*3/4){
            img.height+=50;
        }

        // resize window and image
        windowResize(img.width, img.height);
        img.resize(img.width, img.height);

        image(img,0,0);

        Pix = new Pixel[width][height];   
        for( int y = 0; y < height; y++){  
            for(int x = 0; x < width; x++){
                PVector pos = new PVector(x, y);   
                Pix[x][y] = new Pixel (pos, get(x, y));    
        }}
        pixelSelected = true; 
    }
  
    if(imageSelected == true){
        for( int y = 0; y < height; y++){ 
        for(int x = 0; x <width; x++){
        stroke(Pix[x][y].col);
        point(Pix[x][y].pos.x, Pix[x][y].pos.y);
        }}
        
    }
}

void mouseDragged(){
  PVector mousepos = new PVector(mouseX, mouseY);  
  for(int y = 0; y  < height; y++){
   for (int x = 0; x < width; x++){   
    float dist = Pix[x][y].pos.dist(mousepos);  
        if(dist <= brushsize) {
          noStroke();
          paint = color( r, g, b);
            set(x,y, paint);
            Pix[x][y].col = paint;
        }  
   }
  }  
}
