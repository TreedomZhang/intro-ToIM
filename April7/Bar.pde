Bar myBar;
class Bar {
  float x;
  float y;
  float xbspeed;
  float barwidth;
  float barheight;
  int score;

  Bar () {
    x= 0;
    y=random (0, height);
    xbspeed = random (15, 25);
    
  }

  void barDisplay () {
    frameRate (10);
    fill (random(0,255),87,244 );
    rect (x, y, 15, 15); 
    x+=xbspeed;
  }
  void bugEat () { 
         //boolean score=false;
         textSize(32);
         fill (33, 128, 71);
         text("score :", 10, 30); 
         text(int (myBug.radiusHead-20)/3, 140, 30);
         fill(0, 102, 153);
      //if score ==false;{}
      
     
     
    
       if (x+5<=mouseX+myBug.radiusHead && x>=mouseX-myBug.radiusHead && y>=mouseY-myBug.radiusHead && y+5<=mouseY+myBug.radiusHead){
         
        myBug.radiusHead +=1;
        myBug.radiusBody +=1;
       
      }
   
    
  }
}
