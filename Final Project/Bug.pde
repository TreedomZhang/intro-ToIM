 Bug myBug;
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
      strokeWeight(2);
      stroke (17, 173, 43);
      fill (17, 173, 43);
      circle (xpos, ypos, 2*radiusHead);
      circle ((xpos+radiusHead+radiusBody), ypos, 2*radiusBody);
      circle ((xpos+radiusHead+3*radiusBody), ypos, 2*radiusBody);
      circle ((xpos+radiusHead+5*radiusBody), ypos, 2*radiusBody);
      fill (0, 0, 0);
      circle (xpos-7, ypos-7, 8);
      stroke (237, 14, 51);
      line (xpos+7, ypos+4, xpos+10, ypos+7);
      line (xpos+3.5, ypos+4, xpos+6.5, ypos+7);
    }
    
    void bugOverScreen(){       
      xOverScreen-=0.3;
      strokeWeight(2);
      stroke (17, 173, 43);
      fill (17, 173, 43);
      circle (xOverScreen, yOverScreen, 2*radiusHead);
      circle ((xOverScreen+radiusHead+radiusBody),  yOverScreen, 2*radiusBody);
      circle ((xOverScreen+radiusHead+3*radiusBody), yOverScreen, 2*radiusBody);
      circle ((xOverScreen+radiusHead+5*radiusBody),  yOverScreen, 2*radiusBody);
      fill (0, 0, 0);
      circle (xOverScreen-7, yOverScreen-7, 8);
      stroke (237, 14, 51);
      line (xOverScreen+7, yOverScreen+4, xOverScreen+10, yOverScreen+7);
      line (xOverScreen+3.5, yOverScreen+4, xOverScreen+6.5, yOverScreen+7);
    }
  }
