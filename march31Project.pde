float t=0;
void setup () {
  size (800, 800);//  size of the canvas
}


//create a function to draw circle
void circle () {
  stroke(0);
  beginShape();
  //draw continuous spline curve with reference to https://processing.org/tutorials/curves/
  curveVertex(480, 320); // the first control point
  curveVertex(480, 320); // is also the start point of curve
  curveVertex(494, 346);
  curveVertex(477, 361);
  curveVertex(485, 373);
  curveVertex(470, 388); 
  curveVertex(443, 379);
  curveVertex(429, 386);
  curveVertex(407, 357);
  curveVertex(431, 365);
  curveVertex(429, 349);
  curveVertex(414, 336);
  curveVertex(428, 331);
  curveVertex(433, 326);
  curveVertex(433, 311);
  curveVertex(450, 331);
  curveVertex(463, 326);
  curveVertex(480, 320);// the end point of curve same as the start point which brings a closure
  curveVertex(300, 270); // the last control point
  endShape();
}



void draw () {
  background (255);
  smooth();
  circle (); //draw the original circle;

  int x = -230, y = -180; // the following loop will start with translate (-230,-180) which is push the canvas left 230 and up 180.
  float s = 1.5;// the loop will start with a 1.5 times bigger circle compared to the original one
  float opacity = 60; // the loop will start with opacity 60
  float blue=166; // the loop will start with b=166
  float red=129;//the loop will start with r=129
  float green=38;//the loop will start with g=38


  for (int i = 0; i < 20; i++)  //create a loop that will draw 19 circles
  {
    pushMatrix();
    translate(x, y);   
    scale(s);
    fill(red, green, blue, opacity);
    circle();
    popMatrix();
    x-=140;
    y-=110;
    s+=0.3;
    opacity-=2;
    blue-=12;
    red-=12;
    green-=12;
  } // everytime a circle is drawn, the canvas will move 140 left and 110 up, the size of the canvas will be 0.3 times bigger, the fill will be lighter, and the color will also change 



  // I comment this following whole part out because I used these codes to figure out how much I need to translate everytime to make the bigger circle right above the smaller one. However, after a few 
  // trials, I figured out that everytime when scale became 0.3 bigger, we need to push the paper 140 left and 110 up. So I just turned this process into a loop.

  //translate(-230,-180 );
  //scale(1.5);
  //circle ();
  //popMatrix();

  //pushMatrix();
  //translate(-370,-290 );
  //scale(1.8);
  //circle ();
  //popMatrix();

  //pushMatrix();
  //translate(-460,-370 );
  //scale(2.0);
  //circle ();
  //popMatrix();

  //pushMatrix();
  //translate(-600,-480 );
  //scale(2.3);
  //circle ();
  //popMatrix();

  //pushMatrix();
  //translate(-740,-590 );
  //scale(2.6);
  //circle ();
  //popMatrix();

  //pushMatrix();
  //translate(-880,-700 );
  //scale(2.9);
  //circle ();
  //popMatrix();

  //pushMatrix();
  //translate(-1020,-810 );
  //scale(3.2);
  //circle ();
  //popMatrix();

  //pushMatrix();
  //translate(-1020-140,-810-110 );
  //scale(3.5);
  //circle ();
  //popMatrix();

  //if (frameCount % 10 == 0) {
  //  fill(frameCount * 3 % 255, frameCount * 5 % 255,
  //    frameCount * 7 % 255);
  //  pushMatrix();
  //  translate(600, 600);
  //  rotate(radians(frameCount * 2  % 360));
  //  rect (0, 0, 80, 20);
  //  popMatrix();
  //}

  // draw two cicles using the concept of perlin noise
  t=t+0.02;// to make the circle move
  float smallCircleX = noise (t); //Xpos of smallCircleX is related to t using perlin noise
  smallCircleX= map(smallCircleX, 0, 1, 98, 473); //map the value of noise(t) to the range that I want it to move within, because it's always between 0 and 1
  noStroke();
  float circleXOpacity = map (smallCircleX, 98, 473, 0, 255);// map smallCircleX to the range of the opacity 
  fill (110, 80, 122, circleXOpacity);// if the circle moves right, the fill will become thicker
  ellipse (smallCircleX, 400, 40, 40 );

  t=t+0.02;
  float smallCircleY = noise (t);
  smallCircleY= map(smallCircleY, 0, 1, 74, 366);
  noStroke();
  float circleYOpacity = map (smallCircleY, 74, 366, 0, 255);
  fill (110, 80, 122, circleYOpacity);
  ellipse (470, smallCircleY, 40, 40 );



  ellipse (mouseX, mouseY, 5, 5);
  println ("here is my mouseX " +mouseX+  "here is my mouseY" +mouseY);// print the number of mouseX and mouseY to pinpoint the centers or the start points of your shapes
}
