 Bug myBug;
  class Bug {
    //instantiate
    float xpos;
    float ypos;
    float xspeed;
    float yspeed;
    float radiusHead = 20;
    float radiusBody = 14;

    Bug () {
      xpos = width/2;//mouseX;
      ypos = height/2;//mouseY
      xspeed = 1;
      yspeed = 1;
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
  }
