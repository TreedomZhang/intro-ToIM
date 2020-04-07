Bar myBar;// create a class Bar
class Bar {
  float x;
  float y;
  float xbspeed;// data


  Bar () {
    x= 0;
    y=random (0, height); // all bars(candies) come from the left side of the screen with different y position
    xbspeed = random (15, 25);
  }// constructer

  void barDisplay () {
    frameRate (10);// play slower
    fill (random(0, 255), 87, 244 );// candies change colors 
    rect (x, y, 15, 15); // candies are little squares
    x+=xbspeed;// move from left with different speed from 15-25
  }// create a function that shows the candies 
  
  void bugEat () { 
    textSize(32);
    fill (33, 128, 71);
    text("score :", 10, 30);  // write the text "score ="
    text(int (myBug.radiusHead-20)/1, 140, 30);// write the changing result which is calculated by how many times the radius becomes bigger
    fill(0, 102, 153);

    if (x+5<=mouseX+myBug.radiusHead && x>=mouseX-myBug.radiusHead && y>=mouseY-myBug.radiusHead && y+5<=mouseY+myBug.radiusHead) {
      myBug.radiusHead +=1;
      myBug.radiusBody +=1;// if the four sides of the square are all within the circle of the bug head then the hea and the body will become bigger with one unit increase in r.
    }
  }
}
