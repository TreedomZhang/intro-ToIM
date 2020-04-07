Bar [] myBars = new Bar [30];// create an array of bars/candies/squares I use all these names to describe the "candies" however within the codes I use bars.


void setup () {    
  size (1200, 800);
  myBug = new Bug ();// create a bug out of the bug class
  for (int i = 0; i< myBars.length; i++) {
    myBars [i] = new Bar();
  }
}// create 30 objects out of the array



void draw () {
  background (194, 221, 237);
  mousepos();// print the position of 
  for (int i = 0; i< myBars.length; i++) {
    myBars[i].barDisplay ();
    myBars[i].bugEat();
  }
  myBug.bugDisplay ();// call functions
}



void mousepos () { 
  stroke (17, 173, 43);
  fill (17, 173, 43);// make the color same as the bug in order not to reveal the color
  ellipse (mouseX, mouseY, 5, 5);
  println ("here is my mouseX " +mouseX+  "here is my mouseY" +mouseY);// print the number of mouseX and mouseY // print mouse position 
}

