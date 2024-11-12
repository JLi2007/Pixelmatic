PImage inputImage;
void setup() {
        size(800, 600);
        String address = selectInput(); 
        if (address == null) {
          // If a file was not selected
          println("No file selected.");
        } 
  else {
          // If a file was selected, print path to file
          println(address);
           inputImage = loadImage(address);
          }
void draw() {
        loadPixels();
        inputImage.loadPixels(); 



       updatePixels();
       save("OutputImage.jpg");
       }
}
