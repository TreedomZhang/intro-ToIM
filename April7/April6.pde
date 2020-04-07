Bar [] myBars = new Bar [30];


void setup () {    
  size (1200, 800);
  myBug = new Bug ();
  //myBar = new Bar ();
  for (int i = 0; i< myBars.length; i++) {
    myBars [i] = new Bar();
   
  }
}






void draw () {
  background (194, 221, 237);
  mousepos();
  for (int i = 0; i< myBars.length; i++) {
  myBars[i].barDisplay ();
  myBars[i].bugEat();
}
  myBug.bugDisplay (); 

 


}





void mousepos () { 
  stroke (17, 173, 43);
  fill (17, 173, 43);
  ellipse (mouseX, mouseY, 5, 5);
  println ("here is my mouseX " +mouseX+  "here is my mouseY" +mouseY);// print the number of mouseX and mouseY
}
