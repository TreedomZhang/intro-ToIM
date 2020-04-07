 Bug myBug;//to create a class Bug
  class Bug {
    float xpos;
    float ypos;
    float radiusHead = 20; 
    float radiusBody = 14;//data

    Bug () {
      xpos = mouseX;
      ypos = mouseY;//constructer, bug moves with mouse
                    
    }

    void bugDisplay () { // create a function that displays the bug
      xpos = mouseX;
      ypos = mouseY;
      strokeWeight(2);
      stroke (17, 173, 43);
      fill (17, 173, 43);
      circle (xpos, ypos, 2*radiusHead);
      circle ((xpos+radiusHead+radiusBody), ypos, 2*radiusBody);
      circle ((xpos+radiusHead+3*radiusBody), ypos, 2*radiusBody);
      circle ((xpos+radiusHead+5*radiusBody), ypos, 2*radiusBody);//the body of the bug
      fill (0, 0, 0);
      circle (xpos-7, ypos-7, 8);//the eye of the bug
      stroke (237, 14, 51);
      line (xpos+7, ypos+4, xpos+10, ypos+7);
      line (xpos+3.5, ypos+4, xpos+6.5, ypos+7);//the blush
    }
  }
