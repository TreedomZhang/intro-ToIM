Bar [] myBars = new Bar [30];
Cheerup[] myCheerups =new Cheerup [20];
float textSize = 50;
float textSize2=30;
float textSize3=60;
//float x, y, d;

int screenN;
int screenW=width, screenH=height;
PImage palette;


void setup () {    
  size (1200, 800);
  screenN = 0;
  palette = loadImage("palette.png");//load picture
  myBug = new Bug ();
  myBar =new Bar();
  for (int i = 0; i< myBars.length; i++) {
    myBars [i] = new Bar();
  }
  for (int i = 0; i< myCheerups.length; i++) {
    myCheerups [i] = new Cheerup();
  }
}






void draw () {

  background (194, 221, 237);
  if (screenN == 0) {        //instructions
    introScreen();
  } else if (screenN == 1) { //game playing
    for (int i = 0; i< myBars.length; i++) {
      myBars[i].barDisplay ();
      myBars[i].bugEat();
    }
    myBug.bugDisplay ();
  } else if (screenN == 2) { //game done
    overScreen();
  } else if (screenN==3) {
    colorChoosingScreen();
  }

  mousepos();
}



void introScreen() {
  frameRate(100);
  textSize (textSize3);
  fill(250, 50, 100);
  text("CANDY & BUG", width/2-4*textSize3, height/2);
  fill (250, 120, 123);
  textSize (textSize2);
  text("Click to play!", width/2-4*textSize2, height/2+50); 
  myBug.bugOverScreen ();
  myBar.barSlide();
}


void overScreen() {
  frameRate(80);
  //float textSize = 50;
  // float textSize2=30;
  // float textSize3=60;
  textSize(textSize3);
  fill(252, 10, 79);
  text ("CONGRATULATIONS!", width/2-5*textSize3, height/2-1.5*textSize);
  fill(255, 70, 100);
  textSize(textSize);
  text("Your Score is "+ int (myBug.radiusHead-20)/1+"/30", width/2-5*textSize, height/2);
  textSize(textSize2);
  fill (250, 120, 123);
  text("Click to restart", width/2-3.5*textSize2, height/2+textSize);
  for (int i = 0; i< myCheerups.length; i++) {
    myCheerups[i].cheerupDisplay();
    myBug.bugOverScreen ();
  }
}


void colorChoosingScreen() {
  text("Click to Pick A Color for Your Bug", width/2-8*textSize2, 180);
  imageMode(CENTER); 
  image (palette,width/2,height/2,600,400 );
  
  //loadPixels();
  //palette.loadPixels();// to remind processing to load pixels from the picture
  //for (int x=0; x<width; x++) {
  //  for (int y=0; y<height; y++) { //for all the pixels
  //    int loc =x+y*width;// the numbering of pixels is 0 to width*height, in this way we can locate each single pixel
     
  //  }
  //}
  //updatePixels();
}


void mouseClicked() {
  //changes screen from instructions to game to over and again
  if (screenN == 0 ) { //instruction or over screen          
    screenN = 3;                      //colorpicking screen
  } else if (screenN == 3 ) { //instruction or over screen          
    myBug = new Bug ();
    for (int i = 0; i< myBars.length; i++) {
      myBars [i] = new Bar();               //create a new game
      screenN = 1;                      //game screen
    }                    //colorpicking screen
  } else if (screenN == 2 ) { 
    screenN=0;
    myBug = new Bug ();
    myBar = new Bar();
  }

  //if (screenN == 0 || screenN == 2) { //instruction or over screen
  //  myBug = new Bug ();
  //  for (int i = 0; i< myBars.length; i++) {
  //    myBars [i] = new Bar();               //create a new game
  //    screenN = 1;                      //game screen
  //  }
  //}
}

void mousepos () { 
  stroke (17, 173, 43);
  fill (17, 173, 43);
  ellipse (mouseX, mouseY, 5, 5);
  println ("here is my mouseX " +mouseX+  "here is my mouseY" +mouseY);// print the number of mouseX and mouseY
}

class Cheerup {
  PVector location;  // Location of shape
  PVector velocity;  // Velocity of shape
  PVector gravity;   // Gravity acts at the shape's acceleration

  Cheerup() {
    location = new PVector(random (0, width-24), height);
    velocity = new PVector(random(-10, 10), random(-18, -23));
    gravity = new PVector(0, random(0.2, 0.4));
  }

  void cheerupDisplay() {
    // Add velocity to the location.
    location.add(velocity);
    // Add gravity to velocity
    velocity.add(gravity);

    // Bounce off edges
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height)||(location.y<0)) {
      // We're reducing velocity ever so slightly 
      // when it hits the bottom of the window
      velocity.y = velocity.y * -0.65; 
      location.y = height;
    }

    strokeWeight(2);
    stroke (17, 173, 43);
    fill (random(0, 255), 87, 244 );
    rect (location.x, location.y, 15, 15);
  }
}
