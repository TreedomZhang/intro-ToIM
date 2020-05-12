
float textSize = 50;
float textSize2=30;
float textSize3=60;
float x, y, d;

int screenN;
int screenW=width, screenH=height;
PImage palette;
void setup () {    
  size (1200, 800);
  palette = loadImage("palette.png");//load picture
}

void draw() {
  background (194, 221, 237);
  colorChoosingScreen();
}




void colorChoosingScreen() {
  text("Click to Pick A Color for Your Bug", width/2-8*textSize2, 180);
  strokeWeight(2);
  int colorp = color(245, 169, 213);
  int colorb = color(139, 183, 214);
  int colorg = color (17, 173, 43);
  int colory=color (245, 234, 83);
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      fill (colorb);
      stroke(colorb);
    }
  }

  if (keyPressed) {
    if (key == 'p' || key == 'P') {
      fill (colorp);
      stroke(colorp);
    }
  }
  if (keyPressed) {
    if (key == 'g' || key == 'G') {
      fill (colorg);
      stroke(colorg);
    }
  }
  if (keyPressed) {
    if (key == 'y' || key == 'Y') {
      fill (colory);
      stroke(colory);
    }
  } 
  else {
    fill (colorg);
    stroke(colorg);
  }  
  



  float xx=width/2;
  float yy=height/2;
  int radiusHead =50;
  int radiusBody=40;
  circle (xx, yy, 2*radiusHead);
  circle ((xx+radiusHead+radiusBody), yy, 2*radiusBody);
  circle ((xx+radiusHead+3*radiusBody), yy, 2*radiusBody);
  circle ((xx+radiusHead+5*radiusBody), yy, 2*radiusBody);

  fill (0, 0, 0);
  circle (xx-7, yy-7, 8);
  stroke (237, 14, 51);
  line (xx+7, yy+4, xx+10, yy+7);
  line (xx+3.5, yy+4, xx+6.5, yy+7);
}


//void keyReleased() {
//  if (value == 0) {
//    value = 255;
//  } else {
//    value = 0;
//  }
//}















//imageMode(CENTER); 
//image (palette,width/2,height/2,600,400 );

//loadPixels();
//palette.loadPixels();// to remind processing to load pixels from the picture
//for (int x=0; x<width; x++) {
//  for (int y=0; y<height; y++) { //for all the pixels
//  //float d = dist(x,y,width/2,height/2);
//  //  int loc =x+y*width;// the numbering of pixels is 0 to width*height, in this way we can locate each single pixel
//  // pixels[loc]=color (d);
//}
//}
//updatePixels();




//void overScreen() {
//  float textSize = 50;
//  float textSize2=30;
//  textSize(textSize);
//  text("Your Score is"+ "xxx"+"/30", width/2-5*textSize, height/2);
//  textSize(textSize2);
//  text("Click to restart", width/2-3.5*textSize2, height/2+textSize);
//     for (int i = 0; i< myCheerups.length; i++) {
//    myCheerups[i].cheerupDisplay();
//  }
//}




//class Cheerup {
//    PVector location;  // Location of shape
//   PVector velocity;  // Velocity of shape
//    PVector gravity;   // Gravity acts at the shape's acceleration

//  Cheerup() {
//    location = new PVector(random (0,width-24),height);
//    velocity = new PVector(random(-10,10),random(-15,-25));
//    gravity = new PVector(0,random(0.2,0.4));

//  }

//  void cheerupDisplay() {
//     // Add velocity to the location.
//  location.add(velocity);
//  // Add gravity to velocity
//  velocity.add(gravity);

//  // Bounce off edges
//  if ((location.x > width) || (location.x < 0)) {
//    velocity.x = velocity.x * -1;
//  }
//  if ((location.y > height)||(location.y<0)) {
//    // We're reducing velocity ever so slightly 
//    // when it hits the bottom of the window
//    velocity.y = velocity.y * -0.65; 
//    location.y = height;
//  }


//  strokeWeight(2);
//  stroke (17, 173, 43);
//   fill (random(0, 255), 87, 244 );
//    rect (location.x,location.y, 15, 15); 
//    }
//  }
