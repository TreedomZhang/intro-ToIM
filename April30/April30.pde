PImage theMatrix;
float x, y;
Line[] mylines =new Line [800];

void setup() { 
  size(600, 400);
  theMatrix = loadImage("theMatrix.jpg");
  fill(0, 255, 0);
  tint(105);
  image(theMatrix,0,0, width, height);
  for (int i = 0; i< mylines.length; i++) {
    mylines [i] = new Line();
  }
} 
void draw() { 
  //background(0);
  loadPixels();
  for (int x=0;x<width;x++){
    for (int y=0;y<height;y++){
      int index =x+y*width;
      pixels[index]=color (0);
    }
  }
  updatePixels();
  
  
      
      
  
  for (int i = 0; i< mylines.length; i++) {
    mylines[i].lineDisplay();
  }
}












class Line {
  float xpos, ypos, yspeed;

  Line() {
    xpos=random(0, width);
    ypos=random(0, height);
    yspeed =random(2, 3);
  }

  void lineDisplay() {


    text("1", xpos, ypos, xpos, ypos+4); 
    noFill();
    text("0", xpos, ypos+40);
    ypos+=yspeed;
    if (ypos > random (300, height)) { 
      ypos=0;
    }
  }
}
