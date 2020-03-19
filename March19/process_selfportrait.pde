void setup () {
  size (800, 800);
}

void draw () {
  background (255);
  strokeWeight(2);// make the stroke seems heavier 

  // photobackground
  fill (237, 183, 236);
  rect (271, 104, 260, 287);//a faint purple background

  //hair
  fill (51, 128, 18);
  stroke (51, 128, 18, 230);// dark green fill and stroke
  triangle( 323, 302, 402, 123, 485, 307);  // the back dark green triangle part of the hair
  arc (402, 219, 90, 190, radians (160), radians (380), CHORD);// the front dark green arc part of the hair


  //face
  stroke (  247, 223, 176);
  fill (  247, 223, 176); 
  ellipse (width/2, height/3, 100, 150); // face with stroke of the same color as face
  

  //fringe
  fill (89, 224, 31);
  stroke (12, 12, 13);
  arc (400, 258, 100, 150, PI, TWO_PI, CHORD);// the light green fringe 



  //sunglasses
  stroke (12, 12, 13);// black stroke with color reference to online color picker
  int leftGlassX = width/2 - 40;
  int rightGlassX = width/2 + 12; // the relative Xpositions (compared to width/2) of two pieces of glasses 
  fill (237, random (55, 144), 14); // glass with changing (within the range of orange and red) color
  rect (leftGlassX, 268, 30, 18);
  rect (rightGlassX, 268, 30, 18);// draw sunglasses
  noFill ();
  arc (400, 278, 26, 14, PI, TWO_PI);//the arc connecting two pieces of glass


  //eyes
  noFill (); 
  int leftEyeX = width/2 -24;
  int rightEyeX = width/2 + 24; // the relative Xpositions (compared to width/2) of two eyes 
  ellipse (leftEyeX, 268, 25, 10);
  ellipse (rightEyeX, 268, 25, 10);// two eyes with no color but black stroke
  fill (13, 13, 12);
  ellipse (leftEyeX, 268, 7, 7);
  ellipse (rightEyeX, 268, 7, 7);// draw black eye balls

  
  //nose
  line (401, 283, 410, 293);
  line (410, 293, 401, 293); //a nose composed of two lines
  

  //mouth
  fill ( 237, 57, 66); // set the red color of the mouth with reference to online color picker
  arc(width/2, 310, 26, 14, 0, PI, CHORD); // the lower lip
  arc(width/2+5, 310, 14, 9, PI+QUARTER_PI, TWO_PI);// the upper right half lip
  arc(width/2-5, 310, 14, 9, PI, TWO_PI-QUARTER_PI);// the upper left half lip
  //arc(400, 310, 14, 9, radians(250),radians(280)); Question: here I tried to fill the part between two upper lips with a small arc with red color but didn't find it effective; however, this gave me the inspiration of the bubble gum

 
  //gum
  stroke (100, 237, 134, 200);
  fill(100, 237, 134, 200);// gum with stroke of the same color
  //noStroke();Question Originally, I didn't want to achieve the effect of "noStroke" by changing the color of the stroke but using "noStroke()" directly. BUt why it will remove stroke from all parts no matter where I put "noStroke ()"
  float radius; //define float radius
  radius = map(mouseX, 0, width, 10, 80);// map the radius according to the x position of the mouse
  if  (mouseX > 700)
  {
    radius = 0;
  }
  ellipse (400, 310, radius, radius);// the radius will increase when you move the mouse from left to right but the bubble will pop when your mouse is far right (mouseX >700)

  
  //hairband
  stroke (12, 12, 13);
  fill (242, 90, 7);
  ellipse (400, 180, 25, 15);// draw the orange hairband with black stroke

  
  //earings
  fill (220, 252, 56);
  stroke (220, 252, 56);
  ellipse (350, 302, 10, 10);
  ellipse (449, 302, 10, 10);
  ellipse (350, 322, 15, 15);
  ellipse (449, 322, 15, 15);
  ellipse (350, 342, 20, 20);
  ellipse (449, 342, 20, 20);
  stroke (2, 245, 15);
  line (350, 302, 350, 342);
  line(449, 302, 449, 342);// draw earrings (three increasingly big circles)


  //body
  stroke (  247, 223, 176);
  fill (  247, 223, 176); 
  rect (396, 342, 8, 12);
  triangle (401, 344, 372, 391, 430, 391); // draw a body composed of a rectangle neck and a triangle shoulder with the stroke of the same color


  //cloth
  stroke (235, 14, 231);
  line (384, 376, 384, 390);
  line (418, 376, 418, 390); // draw two spaghrtti straps


  ellipse (mouseX, mouseY, 5, 5);
  println ("here is my mouseX " +mouseX+  "here is my mouseY" +mouseY);// print the number of mouseX and mouseY to pinpoint the centers or the start points of your shapes
}
