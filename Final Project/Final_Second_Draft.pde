Bar myBar;// the bar is the candy
Bug myBug;// the bug is the catepillar
Bar [] myBars = new Bar [30];// 30 bars in the bar array
Cheerup[] myCheerups =new Cheerup [20];// 20 cheerups in the cheer up array, a cheerup is a candy moves in a confetti way
float textSize =50;
float textSize2=30;
float textSize3=60;// three sizes for the text I need to use
int screenN;// screen numbers
int screenW=width, screenH=height;
PImage palette;// include the image palette


void setup () {    
  size (1200, 800);
  screenN = 0;//start with screenN=0 which is the introScreen
  palette = loadImage("palette.png");//load picture
  myBug = new Bug ();//include bug
  myBar =new Bar();
  for (int i = 0; i< myBars.length; i++) {
    myBars [i] = new Bar();
  }                  // include bar array
  for (int i = 0; i< myCheerups.length; i++) {
    myCheerups [i] = new Cheerup();
  }                  //include cheerup array 
}




void draw () {
  background (194, 221, 237);
  if (screenN == 0) {        //intro screen contains basic information
    introScreen();
  } else if (screenN == 1) { //1 is game playing scene
    for (int i = 0; i< myBars.length; i++) {
      myBars[i].barDisplay ();
      myBars[i].bugEat();
    }
    myBug.bugDisplay ();
  } else if (screenN == 2) { //2 is game done scene
    overScreen();
  } else if (screenN==3) {   //3 is choose color scene
    colorChoosingScreen();
  }

  
}



void introScreen() {
  frameRate(100);
  textSize (textSize3);
  fill(250, 50, 100);
  text("CANDY & BUG", width/2-4*textSize3, height/2);
  fill (250, 120, 123);
  textSize (textSize2);
  text("Click to play!", width/2-4*textSize2, height/2+50); // write down the basic words
  myBug.bugOverScreen ();// the name is bugOverScreen is because I originally only wanted it to happen in the Over Screen in which the bug will slide from right to left, however I figured out it
                         //would work pretty nice here
  myBar.barSlide();// a bar/candy slides from left to right
}


void overScreen() {
  frameRate(80);
  textSize(textSize3);
  fill(252, 10, 79);
  text ("CONGRATULATIONS!", width/2-5*textSize3, height/2-1.5*textSize);
  fill(255, 70, 100);
  textSize(textSize);
  text("Your Score is "+ int (myBug.radiusHead-20)/1+"/30", width/2-5*textSize, height/2);// everytime the bug eats a candy its headRadius will increase by one so I use this 
                                                                                          //"(myBug.radiusHead-20)/1" to update the score. "/30" is the total number of candies
  textSize(textSize2);
  fill (250, 120, 123);
  text("Click to restart", width/2-3.5*textSize2, height/2+textSize);
  for (int i = 0; i< myCheerups.length; i++) {
    myCheerups[i].cheerupDisplay();//candies thrown into the sky
    myBug.bugOverScreen ();// bug slides from right to left
  }
}


void colorChoosingScreen() {
  text("Click to Pick A Color for Your Bug", width/2-8*textSize2, 180);
  imageMode(CENTER); 
  image (palette, width/2, height/2, 600, 400 );// put the palette image in the midle
  color c = get(mouseX, mouseY);//get pixel in the palette
  if (mouseX>width/2-300&& mouseX<width/2+300&&mouseY>height/2-200&&mouseY<height/2+200) {// only if the mouse position is within the boundaries of the palette, the color of the bug will show
    fill(c);
    stroke(c);// fill the bug with the color picked
    // below isto draw the bug
    int radiusHead =50;
    int radiusBody=40;
    float xx=width/2-2.2*radiusHead;
    float yy=height-100;
    circle (xx, yy, 2*radiusHead);// draw head
    circle ((xx+radiusHead+radiusBody), yy, 2*radiusBody);//draw body
    circle ((xx+radiusHead+3*radiusBody), yy, 2*radiusBody);
    circle ((xx+radiusHead+5*radiusBody), yy, 2*radiusBody);
    fill (0, 0, 0);// draw eyes
    circle (xx-7, yy-7, 8);
    stroke (237, 14, 51);//draw blush
    line (xx+7, yy+4, xx+10, yy+7);
    line (xx+3.5, yy+4, xx+6.5, yy+7);
  }
}






void mouseClicked() {
  //changes screen from intro to color picking screen
  if (screenN == 0 ) { //instruction or over screen          
    screenN = 3;                      //colorpicking screen
  } else if (screenN == 3 ) { //if we click the mouse on color picking screen we will go into the game  
    color c = get(mouseX, mouseY);
    if (mouseX>width/2-300&& mouseX<width/2+300&&mouseY>height/2-200&&mouseY<height/2+200) {
      fill(c);
      stroke(c);
    }
    myBug = new Bug ();// prepare a new bug and bars
    for (int i = 0; i< myBars.length; i++) {
      myBars [i] = new Bar();               //create a new game
      screenN = 1;                      //game screen
    }                    //colorpicking screen
  } else if (screenN == 2 ) { // change from end screen to intro screen to restart the game
    screenN=0;
    myBug = new Bug ();//reset the sliding bug and the bar
    myBar = new Bar();
  }
}

void mousepos () { // to track mouse position
  stroke (17, 173, 43);// it was firstly used to hind the color of the mouse ellipse
  fill (17, 173, 43);
  ellipse (mouseX, mouseY, 5, 5);
  println ("here is my mouseX " +mouseX+  "here is my mouseY" +mouseY);// print the number of mouseX and mouseY
}




//Class Cheerup——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
class Cheerup {
  PVector location;  // Location of shape
  PVector velocity;  // Velocity of shape
  PVector gravity;   // Gravity acts at the shape's acceleration

  Cheerup() {
    location = new PVector(random (0, width-24), height);// happen from the bottom
    velocity = new PVector(random(-10, 10), random(-18, -23)); // the x speed varies from -10 to 10 while y speed varies from -18 to -23
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

    strokeWeight(2);// draw the bar
    stroke (17, 173, 43);
    fill (random(0, 255), 87, 244 );
    rect (location.x, location.y, 15, 15);
  }
}



//Class Bar————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
class Bar {
  float x;
  float y;
  float xbspeed;
  float barwidth;
  float barheight;
  int score;

  Bar () {//constructer
    x= 0;
    y=random (0, height);// bars/candies coming from different height
    xbspeed = random (15, 25);// with different speed
  }

  void barDisplay () {
    frameRate (10);
    stroke (17, 173, 43);
    fill (random(0, 255), 87, 244 );
    rect (x, y, 15, 15); 
    x+=xbspeed;// bars move towards right
  }

  void bugEat () { 
    textSize(32);
    fill (33, 128, 71);
    text("score :", 10, 30); 
    text(int(myBug.radiusHead-20/1)+"/30", 140, 30);// everytime the bug eats a candy its headRadius will increase by one so I use this 
                                                    //"(myBug.radiusHead-20)/1" to update the score. "/30" is the total number of candies
    fill(0, 102, 153);
    if (x+5<=mouseX+myBug.radiusHead && x>=mouseX-myBug.radiusHead && y>=mouseY-myBug.radiusHead && y+5<=mouseY+myBug.radiusHead) { // if the bar enters the head
      myBug.radiusHead +=1;
      myBug.radiusBody +=1; // the head and body will be bigger
      x+=width;// in order to let the candy disappear
    }

    if ( x > width*3.1) {// this comes from multiple trials to see when is the best time to end game screen into end screen
      smooth();
      for (int i = 0; i< myCheerups.length; i++) {
        myCheerups [i] = new Cheerup();//game over
      }// cheer up candies spread out
      screenN = 2;// enter end screen
    }
  }


  void barSlide() {// this is used in intro screen where there is a bar sliding from left to right
    stroke (33, 128, 71);
    fill (random(0, 255), 87, 244 );
    rect (x, y, 15, 15); 
    y=height-315;
    x+=1;
  }
}

//class Bug————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
class Bug {
  //instantiate
  float xpos;
  float ypos;
  float xOverScreen;
  float yOverScreen;
  float xspeed;
  float yspeed;
  float radiusHead = 20;
  float radiusBody = 14;


  Bug () {
    xpos = width/2;//mouseX;
    ypos = height/2;//mouseY
    xspeed = 1;
    yspeed = 1;
    xOverScreen=width;
    yOverScreen=height-300;
  }

  void bugDisplay () {
    xpos = mouseX;
    ypos = mouseY;
    // draw the bug
    strokeWeight(2);
    stroke (17, 173, 43);
    fill (17, 173, 43);
    circle (xpos, ypos, 2*radiusHead);// head
    circle ((xpos+radiusHead+radiusBody), ypos, 2*radiusBody);// three body circles
    circle ((xpos+radiusHead+3*radiusBody), ypos, 2*radiusBody);
    circle ((xpos+radiusHead+5*radiusBody), ypos, 2*radiusBody);
    fill (0, 0, 0);// eye
    circle (xpos-7, ypos-7, 8);
    stroke (237, 14, 51);// blush
    line (xpos+7, ypos+4, xpos+10, ypos+7);
    line (xpos+3.5, ypos+4, xpos+6.5, ypos+7);
  }

  void bugOverScreen() {   // this is used in the end screen where there is a bug sliding from right to left    
    xOverScreen-=0.3;
    strokeWeight(2);
    stroke (17, 173, 43);
    fill (17, 173, 43);
    circle (xOverScreen, yOverScreen, 2*radiusHead);
    circle ((xOverScreen+radiusHead+radiusBody), yOverScreen, 2*radiusBody);
    circle ((xOverScreen+radiusHead+3*radiusBody), yOverScreen, 2*radiusBody);
    circle ((xOverScreen+radiusHead+5*radiusBody), yOverScreen, 2*radiusBody);
    fill (0, 0, 0);
    circle (xOverScreen-7, yOverScreen-7, 8);
    stroke (237, 14, 51);
    line (xOverScreen+7, yOverScreen+4, xOverScreen+10, yOverScreen+7);
    line (xOverScreen+3.5, yOverScreen+4, xOverScreen+6.5, yOverScreen+7);
  }
}
