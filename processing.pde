void setup() {
  selectInput("Select a file to process:", "fileSelected");
  size(500,500);
}

PImage img;
int z, imageslected;
float x,y;
Pixel [] pix = new Pixel  [width * height];

void fileSelected(File selection) {
  
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    
    String file = selection.getAbsolutePath();
    
    for( int i =0; i< file.length(); i++){
     
     int x =  file.indexOf("\\", i);
     if(x != -1){
       
       z = x;

     }
    }
        String fileImage = file.substring(z + 1);
       img = loadImage(fileImage);
       imageslected = 1;
       
  }
  
}


void draw(){
  if(imageslected ==1){
  image(img,0,0);
  loadPixels();
    
  for(int i =0; i< height; i++){
    for(int j = 0; j < width; j++){
   
      pix[i+j] = new Pixel(new PVector(j,i), pixels[i+j]);
      
    }}
    
    for(Pixel p: pix){
      
      color c = color(204,204,204);

      if ( p.col  == c){
        println(p.pos);
        
      }
      
    }
  

    
  
    
  
  
  
  
  
}
}
